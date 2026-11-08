// Exhaustive connectivity certificate for the even-order P005 matching switch graph.
// Build: g++ -std=c++17 -O3 experiments/P005_even_bipartite_switch_bfs.cpp -o p005_bfs
// Run:   ./p005_bfs 11
// For m=11 (n=22), expects 4051872 states in a single component.
//
// This enumerates the bipartite matching switch graph R(B_m), not the
// enormous Cartesian square C_(2m). It compares BFS reachability to an
// independent subset-DP permanent. It is finite evidence, not a proof for
// all m.
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <unordered_set>
#include <vector>
using namespace std;

static uint64_t encode(const vector<int>& a) {
    uint64_t state = 0;
    for (int i = 0; i < int(a.size()); ++i)
        state |= uint64_t(a[i]) << (4 * i);
    return state;
}

int main(int argc, char** argv) {
    int m = argc > 1 ? atoi(argv[1]) : 11;
    if (m < 1 || m > 11) {
        cerr << "Choose 1 <= m <= 11 (larger searches require extra resources).\n";
        return 2;
    }

    vector<vector<bool>> admissible(m, vector<bool>(m));
    for (int i = 0; i < m; ++i)
        for (int j = 0; j < m; ++j)
            admissible[i][j] = gcd(2*i + 2, 2*j + 1) == 1;

    // Number of perfect matchings, independently computed by subset DP.
    vector<uint64_t> dp(1 << m);
    dp[0] = 1;
    for (int mask = 0; mask < (1 << m) - 1; ++mask) {
        int row = __builtin_popcount(unsigned(mask));
        for (int j = 0; j < m; ++j)
            if (!(mask & (1 << j)) && admissible[row][j])
                dp[mask | (1 << j)] += dp[mask];
    }
    uint64_t total = dp[(1 << m) - 1];

    // Start with the coprime matching 2i+2 <-> 2i+1.
    vector<int> assignment(m);
    iota(assignment.begin(), assignment.end(), 0);
    unordered_set<uint64_t> reached;
    reached.reserve(total);
    vector<uint64_t> bfs;
    bfs.reserve(total);
    auto start = encode(assignment);
    reached.insert(start);
    bfs.push_back(start);

    for (size_t head = 0; head < bfs.size(); ++head) {
        uint64_t state = bfs[head];
        for (int i = 0; i < m; ++i)
            assignment[i] = (state >> (4*i)) & 15;

        for (int i = 0; i < m; ++i) for (int j = i+1; j < m; ++j) {
            if (!admissible[i][assignment[j]] ||
                !admissible[j][assignment[i]]) continue;

            uint64_t next = state;
            next &= ~(uint64_t(15) << (4*i));
            next &= ~(uint64_t(15) << (4*j));
            next |= uint64_t(assignment[j]) << (4*i);
            next |= uint64_t(assignment[i]) << (4*j);
            if (reached.insert(next).second) bfs.push_back(next);
        }
    }

    cout << "m=" << m << " n=" << 2*m
         << " perfect_matchings=" << total
         << " reached=" << reached.size()
         << " connected=" << (reached.size() == total) << '\n';
    return reached.size() == total ? 0 : 1;
}
