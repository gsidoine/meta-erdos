#!/usr/bin/env python3
"""P033: exact finite certificate for universal three-prime connectivity.

The first phase checks n=3,...,120 by exhaustive union-find search for
two or three prime-sum colors. The second verifies 103 fixed triples
which cover every n from 121 through more than 10^10, using the
proved three-reflection criterion n >= 5 D - 2.

All primality assertions use trial division, not probabilistic tests.
The separate analytic proof for n >= 10^10 is in the theorem note.
"""
from fractions import Fraction
from itertools import combinations
from math import gcd, isqrt


# Each row: first_n last_n smaller_prime middle_prime larger_prime.
# For every n in [first_n,last_n], the three prime sums connect [n].
CERTIFICATE = """
121 130 109 113 131
131 138 113 127 139
139 162 131 137 163
163 180 149 151 181
181 210 173 179 211
211 240 197 199 241
241 282 233 239 283
283 336 271 281 337
337 396 317 331 397
397 466 379 389 467
467 556 461 463 557
557 658 541 547 659
659 786 647 653 787
787 936 751 773 937
937 1122 919 929 1123
1123 1326 1109 1117 1327
1327 1582 1319 1321 1583
1583 1888 1571 1579 1889
1889 2266 1877 1879 2267
2267 2718 2237 2251 2719
2719 3258 2711 2713 3259
3259 3910 3253 3257 3911
3911 4690 3889 3907 4691
4691 5622 4673 4679 5623
5623 6736 5581 5591 6737
6737 8080 6719 6733 8081
8081 9696 8059 8069 9697
9697 11632 9679 9689 11633
11633 13932 11579 11621 13933
13933 16702 13921 13931 16703
16703 20028 16691 16699 20029
20029 24028 20021 20023 24029
24029 28816 24019 24023 28817
28817 34548 28751 28813 34549
34549 41452 34537 34543 41453
41453 49740 41411 41443 49741
49741 59670 49697 49739 59671
59671 71596 59659 59669 71597
71597 85908 71483 71593 85909
85909 103090 85889 85903 103091
103091 123706 103069 103087 123707
123707 148438 123667 123701 148439
148439 178126 148411 148429 178127
178127 213750 178103 178117 213751
213751 256498 213727 213737 256499
256499 307758 256489 256493 307759
307759 369300 307711 307733 369301
369301 443160 369283 369293 443161
443161 531792 443153 443159 531793
531793 638146 531673 531731 638147
638147 765772 638059 638123 765773
765773 918912 765763 765767 918913
918913 1102692 918889 918899 1102693
1102693 1323220 1102669 1102691 1323221
1323221 1587846 1323197 1323199 1587847
1587847 1905390 1587809 1587841 1905391
1905391 2286468 1905367 1905383 2286469
2286469 2743758 2286443 2286457 2743759
2743759 3292510 2743669 2743751 3292511
3292511 3951000 3292463 3292507 3951001
3951001 4741182 3950941 3950951 4741183
4741183 5689402 4741129 4741169 5689403
5689403 6827280 5689367 5689381 6827281
6827281 8192698 6827167 6827273 8192699
8192699 9831222 8192633 8192677 9831223
9831223 11797440 9831191 9831193 11797441
11797441 14156928 11797361 11797363 14156929
14156929 16988302 14156893 14156927 16988303
16988303 20385930 16988189 16988281 20385931
20385931 24463096 20385823 20385887 24463097
24463097 29355706 24462989 24463063 29355707
29355707 35226808 29355679 29355691 35226809
35226809 42272146 35226773 35226799 42272147
42272147 50726566 42272119 42272141 50726567
50726567 60871870 50726449 50726551 60871871
60871871 73046226 60871829 60871859 73046227
73046227 87655470 73046179 73046201 87655471
87655471 105186562 87655441 87655453 105186563
105186563 126223872 105186539 105186547 126223873
126223873 151468612 126223837 126223843 151468613
151468613 181762312 151468519 151468571 181762313
181762313 218114748 181762271 181762309 218114749
218114749 261737698 218114669 218114731 261737699
261737699 314085228 261737659 261737687 314085229
314085229 376902232 314085169 314085227 376902233
376902233 452282650 376902161 376902199 452282651
452282651 542739172 452282627 452282641 542739173
542739173 651286930 542739049 542739167 651286931
651286931 781544292 651286879 651286919 781544293
781544293 937853142 781544021 781544263 937853143
937853143 1125423736 937853131 937853141 1125423737
1125423737 1350508450 1125423701 1125423727 1350508451
1350508451 1620610140 1350508403 1350508447 1620610141
1620610141 1944732148 1620610099 1620610133 1944732149
1944732149 2333678536 1944732071 1944732121 2333678537
2333678537 2800414228 2333678521 2333678531 2800414229
2800414229 3360497056 2800414219 2800414223 3360497057
3360497057 4032596452 3360497051 3360497053 4032596453
4032596453 4839115740 4032596387 4032596429 4839115741
4839115741 5806938888 4839115703 4839115709 5806938889
5806938889 6968326662 5806938881 5806938883 6968326663
6968326663 8361991992 6968326579 6968326637 8361991993
8361991993 10034390380 8361991907 8361991933 10034390381
"""


def prime_sieve(limit):
    sieve = bytearray(b"\1") * (limit + 1)
    sieve[:2] = b"\0\0"
    for p in range(2, isqrt(limit) + 1):
        if sieve[p]:
            sieve[p * p::p] = bytes(len(sieve[p * p::p]))
    return [p for p in range(limit + 1) if sieve[p]]


def prime_by_trial_division(x, small_primes):
    if x < 2:
        return False
    for p in small_primes:
        if p * p > x:
            return True
        if x % p == 0:
            return False
    raise ValueError("Insufficient trial division range")


def connected(n, colors):
    parent = list(range(n + 1))
    sizes = [1] * (n + 1)

    def root(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    for c in colors:
        for x in range(max(1, c - n), min(n, (c - 1) // 2) + 1):
            y = c - x
            if y <= n and x < y:
                a, b = root(x), root(y)
                if a != b:
                    if sizes[a] < sizes[b]:
                        a, b = b, a
                    parent[b] = a
                    sizes[a] += sizes[b]
                    if sizes[a] == n:
                        return True
    return sizes[root(1)] == n


def verify_small():
    two = three = 0
    for n in range(3, 121):
        colors = prime_sieve(2 * n - 1)
        found = None
        for k in (2, 3):
            for palette in combinations(colors, k):
                if connected(n, palette):
                    found = palette
                    break
            if found is not None:
                break
        assert found is not None, n
        if len(found) == 2:
            two += 1
        else:
            three += 1
    assert (two, three) == (28, 90)
    return two, three


def verify_intervals():
    rows = [tuple(map(int, row.split())) for row in CERTIFICATE.splitlines() if row.strip()]
    assert len(rows) == 103
    primes = prime_sieve(isqrt(max(row[-1] for row in rows)) + 1)
    expected = 121
    for first, last, p, q, r in rows:
        assert first == expected
        assert p < q < first <= last < r
        assert all(prime_by_trial_division(z, primes) for z in (p, q, r))
        assert gcd((q - p) // 2, (r - p) // 2) == 1
        # Endpoints of the exact interval on which the corollary applies.
        assert first >= max(q + 1, (5 * r - 2 + 5) // 6)
        assert last <= min(r - 1, (5 * p + 2) // 4)
        # Convexity verifies the near-n condition throughout each interval.
        for n in (first, last):
            d = max(n - p, r - n)
            assert n >= 5 * d - 2
        expected = last + 1
    assert expected > 10**10
    return len(rows), expected - 1


def verify_analytic_constants():
    """Exact rational checks for the three error-budget inequalities."""
    F = Fraction
    e = F(7, 10000)
    s = (1 + 2 * e)**3 / 4 + F(1, 2) + 12 * e + 1500 * e**2 + 250500 * e**3
    low = s / (F(98, 100) * F(99, 100)**2)
    middle = 8 / (F(98, 100) * F(42, 100)**3 * 999)
    large = (F(102, 100) / F(49, 100)) * (
        F(24**2, 10**5 - 1) + F(6 * 24**2 * 25, 10**10)
    )
    assert low < F(4, 5)
    assert middle < F(3, 25)
    assert large < F(1, 50)
    assert low + middle + large < 1
    return low, middle, large


if __name__ == "__main__":
    two, three = verify_small()
    count, endpoint = verify_intervals()
    l, m, h = verify_analytic_constants()
    print(f"Small n=3..120: {two} two-color and {three} three-color instances")
    print(f"{count} certified prime triples cover every integer 121..{endpoint:,}")
    print(f"Analytic obstruction budgets: low={float(l):.6f}, "
          f"medium={float(m):.6f}, large={float(h):.6f}; total < 1")
    print("P033 finite certificate verified.")
