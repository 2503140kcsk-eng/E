# Formalization status and proof obligations

Last audited: 2026-11-03.

## Current verified boundary

HakuiKoyoriNumber/Arithmetic.lean defines the 2000-step binary power tower and proves the arithmetic implication

\[
Q\cdot n\le H\quad\land\quad 1\le n\quad\Longrightarrow\quad n<H,
\]

where \(Q=T_{2000}+2\).

This file contains no sorry, admit, or user-defined axioms. A GitHub Actions Lean build and axiom audit have been configured. Until a run reports success, do not describe the Lean build as passed.

## Not yet formalized

The following are open obligations; none is being hidden behind an axiom:

1. A finite multigraph model with loops and multiple edges, maximum-valence predicate, and a canonical finite representation up to isomorphism.
2. A precise homeomorphic-embedding/topological-minor relation matching Friedman's definition.
3. The graph-minor well-quasi-order theorem for finite subcubic graphs, either formalized in Lean or imported from a separately audited formal library. No suitable complete Lean formalization has yet been identified.
4. The finite-tag WQO theorem and finite-branching bad-prefix tree.
5. The construction of the \(Q\) tagged copies of a maximal SCG(13) bad sequence, including the index-shift vertex-bound proof.
6. Definition of the actual maximum as a closed natural number inside Lean, followed by the theorem \(\mathrm{SCG}(13)<\mathrm{HakuiKoyoriNumber}\).

## Acceptance gates

- **Definition gate:** the Lean graph model is definitionally identical to the prose model; loop and parallel-edge degree conventions are explicit.
- **WQO gate:** no axiom may stand in for Robertson–Seymour unless the project explicitly labels the final theorem conditional. A named theorem with a proof term or an audited imported theorem is required.
- **Maximum gate:** prove finite branching and no infinite branch, then define the height/maximum without an assumed bound.
- **Comparison gate:** prove the tagged-copy sequence has length \(Q\cdot\mathrm{SCG}(13)\) and is admissible.
- **Kernel gate:** lake build, the axiom audit, and an independent checker must pass. CI status is evidence only for the files and commit actually checked.

## Important distinction

The mathematical argument in docs/definition-and-proof.md is a complete paper proof from the standard subcubic graph WQO theorem. The current Lean repository does **not** yet contain a kernel-checked formalization of that graph theorem or of the whole HKN construction. The project is therefore at a real intermediate milestone, not at “fully formalized.”
