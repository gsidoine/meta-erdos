# Parity translation and admissible flips

Let \(v_0,\ldots,v_{n-1}\) be the cyclic vertices of a strictly convex lattice polygon.

**Proposition 1.** Three lattice points \(a,b,c\) form a triangle with odd normalized area if and only if their reductions modulo \(2\) are three distinct elements of \(\mathbb F_2^2\).

**Proof.** The normalized area is \(|\det(b-a,c-a)|\). Modulo \(2\) this determinant is nonzero exactly when the two difference vectors are linearly independent in \(\mathbb F_2^2\), equivalent to distinctness of all three affine points. \(\square\)

**Proposition 2.** In an odd-area triangulation, a quadrilateral diagonal is flippable while preserving odd normalized area if and only if all four vertices of the quadrilateral have different residue classes modulo \(2\).

**Proof.** Let the cyclic vertices be \(a,b,c,d\), with current diagonal \(ac\). The triangles \(abc\) and \(acd\) are valid only when the colors of \(a,c\) are distinct and both colors of \(b,d\) differ from those of \(a,c\). The replacement diagonal \(bd\) gives two valid triangles precisely when \(b,d\) are distinct as well. \(\square\)

**Obstruction.** With exactly three residue classes, every admissible triangulation is isolated in the admissible flip graph. The six-vertex cyclic pattern \((0,1,0,2,1,2)\) has exactly two valid triangulations and no admissible flip.

The unresolved case asks for four residue classes and at least two valid states. These results are elementary; the literature comparison is in [prior-art.md](../references/prior-art.md).
