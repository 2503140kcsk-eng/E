# Definition and comparison proof

## 1. Source benchmark: SCG(13)

We follow Harvey Friedman's primary statement, “[FOM] 279: Subcubic Graph Numbers/restated” (8 April 2006):

- A subcubic graph is finite and every vertex has valence at most 3.
- Loops and multiple edges are allowed.
- \(\mathrm{SCG}(k)\) is the longest length \(n\) of a sequence \(G_1,\ldots,G_n\) such that \(|V(G_i)|\le i+k\) and no \(G_i\) for \(i<j\) is homeomorphically embeddable into \(G_j\).

Primary source: https://www.fomarchive.ugent.be/2006-April/010362.html

“Homeomorphically embeddable” is used in Friedman's graph-theoretic sense (topological-minor/subdivision embedding). We do not silently replace it with induced-subgraph embedding.

For a literal combinatorial convention, represent an undirected finite multigraph as finite vertex and edge sets together with an endpoint map from each edge to an unordered pair of vertices. Distinct edge elements may have the same endpoints, and an edge may have equal endpoints (a loop). The valence of a vertex counts each incident non-loop edge once and each loop twice. “Subcubic” means every vertex has valence at most 3.

A subdivision replaces each edge by a path with the same endpoints, using new internal vertices that are distinct from all other replacement paths; a loop is replaced by a cycle based at its original vertex. A graph (G) is homeomorphically embeddable into (H) exactly when some subdivision of (G) is isomorphic to a subgraph of (H). All graphs in (mathcal G_3) are taken up to isomorphism. This spells out the standard subdivision convention used in the rest of this document.

## 2. Tower parameter

Define the natural numbers \(T_r\) by primitive recursion:

\[
T_0=1,\qquad T_{r+1}=2^{T_r}.
\]

Thus \(T_{2000}\) is a tower of 2s of height 2000 under the convention \(2\uparrow\uparrow 2000\). Fix

\[
Q:=T_{2000}+2.
\]

The two extra identifiers may be viewed as control/calibration batches. Their interpretation is mnemonic only; the mathematical definition is the equation above.

## 3. Experiment-tagged graph objects

Let \(\mathcal G_3\) be the class of isomorphism types of finite subcubic multigraphs (loops and parallel edges allowed). An experiment-tagged graph is a pair

\[
x=(c,G)\in \mathrm{Fin}(Q)\times\mathcal G_3.
\]

For \(x=(c,G)\) and \(y=(d,H)\), define

\[
x\preceq_Q y
\quad\Longleftrightarrow\quad
(c=d)\land(G\hookrightarrow_{\mathrm{homeo}} H).
\]

The tag is global to the graph object. In particular, objects with different tags are incomparable, even if one underlying graph is empty.

## 4. Hakui Koyori Number

A finite sequence \(x_1,\ldots,x_m\), with \(x_i=(c_i,G_i)\), is HKN-admissible when:

\[
\forall i\in\{1,\ldots,m\},\quad |V(G_i)|\le i+13,
\]

and

\[
\forall i<j,\quad \neg(x_i\preceq_Q x_j).
\]

Define

\[
\boxed{\mathrm{HKN}:=
\max\{m\in\mathbb N:\text{there exists an HKN-admissible sequence of length }m\}.}
\]

This is a definition by a finite combinatorial maximum, not a decimal expansion or an executable approximation. The next section proves that the maximum exists and is finite.

## 5. Existence and finiteness

**Theorem 1 (finite-tag WQO).** The class \(\mathrm{Fin}(Q)\times\mathcal G_3\), under \(\preceq_Q\), is well-quasi-ordered.

*Proof.* Consider any infinite sequence \((c_i,G_i)_{i\in\mathbb N}\). Since \(\mathrm{Fin}(Q)\) is finite, at least one tag \(c\) occurs infinitely often. Restrict to that infinite subsequence. The untagged finite subcubic graphs are well-quasi-ordered under homeomorphic embeddability by the graph-minor theorem in the subcubic setting. Hence two terms in this subsequence, in their original order, satisfy \(G_i\hookrightarrow_{\mathrm{homeo}}G_j\). Their tags are equal, so \((c_i,G_i)\preceq_Q(c_j,G_j)\). Therefore no infinite bad sequence exists. \(\square\)

**Theorem 2 (the maximum exists).** The set of HKN-admissible sequence lengths is bounded.

*Proof.* Form the rooted tree whose nodes are finite HKN-admissible prefixes, with one-step extension as the child relation. At depth \(i\), the next graph has at most \(i+13\) vertices. For at most \(N\) vertices, the sum of valences is at most \(3N\), and every edge (including a loop) contributes 2 to that sum; hence there are at most \(\lfloor 3N/2\rfloor\) edge instances. With finitely many vertex labels and bounded edge multiplicity, only finitely many incidence tables and therefore finitely many isomorphism types exist. There are only \(Q\) tags. Thus every node has finitely many children. If the tree had nodes at arbitrarily large depths, König's lemma for finitely branching trees would give an infinite branch, i.e. an infinite \(\preceq_Q\)-bad sequence. This contradicts Theorem 1. The tree is therefore finite, and its maximum depth is exactly HKN. \(\square\)

The same argument, with one tag, supplies the finiteness underlying \(\mathrm{SCG}(13)\).

## 6. Strict lower bound over SCG(13)

Let \(L=\mathrm{SCG}(13)\), and choose a maximal SCG sequence

\[
G_1,\ldots,G_L,\qquad |V(G_i)|\le i+13,
\]

with no \(i<j\) such that \(G_i\hookrightarrow_{\mathrm{homeo}}G_j\).

For each tag \(c\in\{0,\ldots,Q-1\}\), make a block

\[
B_c=((c,G_1),(c,G_2),\ldots,(c,G_L)).
\]

Concatenate the \(Q\) blocks in increasing tag order. We verify admissibility.

1. **Vertex bound.** The term \((c,G_i)\) occurs at global position \(j=cL+i\) when tags are numbered from zero. Its graph has at most \(i+13\le cL+i+13=j+13\) vertices.
2. **Within one block.** Tags agree, so a forbidden tagged embedding would be an embedding \(G_i\hookrightarrow_{\mathrm{homeo}}G_j\) in the original SCG sequence. No such pair exists.
3. **Across two blocks.** Their tags differ, so the definition of \(\preceq_Q\) forbids an embedding, regardless of the underlying graphs.

Consequently this is an HKN-admissible sequence of length \(QL\). Therefore

\[
\mathrm{HKN}\ge QL=Q\cdot\mathrm{SCG}(13).
\]

Since \(Q=T_{2000}+2\ge2\), and \(L\ge1\) (a one-term sequence exists),

\[
\boxed{\mathrm{HKN}\ge (T_{2000}+2)\,\mathrm{SCG}(13)>\mathrm{SCG}(13).}
\]

In particular, the multiplicative separation is at least a 2000-level power tower plus two.

## 7. What this proves—and what it does not

- It gives a fully specified finite natural number by a finite maximum.
- Its existence depends on the established well-quasi-order theorem for finite subcubic graphs under homeomorphic embeddability; the finite-tag extension is proved above by the infinite pigeonhole principle.
- It proves a strict and explicit multiplicative lower bound over SCG(13), without using SCG(13) as an input in the HKN definition.
- It does **not** say HKN is the largest definable finite integer. There is no absolute largest definable finite integer: from any defined integer one can define its successor.
- The paper proof is not yet a complete Lean proof. See the formalization status and issues for the remaining kernel-checked work.
