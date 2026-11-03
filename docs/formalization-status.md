# Formalization status and proof obligations

Last audited: 2026-11-03.

## Current verified boundary

HakuiKoyoriNumber/Arithmetic.lean defines the recursive tower

\[
T_0=1,\qquad T_{n+1}=2^{T_n}
\]

and the batch count \(Q=T_{2000}+2\). Its Lean theorem is the conditional arithmetic implication

\[
(1\le L)\land(2\le Q)\land(Q\cdot L\le H)\Longrightarrow L<H.
\]

Here \(L\) stands for \(\mathrm{SCG}(13)\), and \(H\) stands for HKN. The Lean module does not calculate the tower: it leaves the tower as a symbolic natural-number term.

**CI evidence:** GitHub Actions run [41603810346](https://github.com/2503140kcsk-eng/E/actions/runs/41603810346), commit 60ee5978518783bc5d652f2a46c243503389ad63, completed successfully on 2026-11-03. The logs show:

- Lean toolchain leanprover/lean4:v4.36.0-rc2 installed successfully.
- lake build built HakuiKoyoriNumber.Arithmetic and HakuiKoyoriNumber.
- axiom-audit completed successfully.

The bundled leanchecker was attempted in runs 41604277693 and 41604429439, including with LEAN_NUM_THREADS=1, but both attempts exited with code 139. It is not counted as a successful check and has been removed from the default workflow. nanoda has not been run. The successful build and axiom-audit result verifies only the arithmetic Lean module, not the graph-theoretic argument.

The arithmetic source contains no sorry, admit, or user-defined axioms. This fact must not be mistaken for a completed formal proof of the entire graph theorem.

## Not yet formalized

The following are open obligations; none is being hidden behind an axiom:

1. A finite multigraph model with loops and multiple edges, maximum-valence predicate, and a canonical finite representation up to isomorphism.
2. A precise homeomorphic-embedding/topological-minor relation matching Friedman's definition.
3. The graph-minor well-quasi-order theorem for finite subcubic graphs, either formalized in Lean or imported from a separately audited formal library. No suitable complete Lean formalization has yet been identified.
4. The finite-tag WQO theorem and finite-branching bad-prefix tree.
5. The construction of the \(Q\) tagged copies of a maximal SCG(13) bad sequence, including the index-shift vertex-bound proof.
6. Definition of the actual maximum as a closed natural number inside Lean, followed by the theorem SCG13 < HakuiKoyoriNumber.

## Acceptance gates

- **Definition gate:** the Lean graph model is definitionally identical to the prose model; loop and parallel-edge degree conventions are explicit.
- **WQO gate:** no axiom may stand in for Robertson–Seymour unless the project explicitly labels the final theorem conditional. A named theorem with a proof term or an audited imported theorem is required.
- **Maximum gate:** prove finite branching and no infinite branch, then define the height/maximum without an assumed bound.
- **Comparison gate:** prove the tagged-copy sequence has length \(Q\cdot\mathrm{SCG}(13)\) and is admissible.
- **Kernel gate:** lake build, the axiom audit, and an independent checker must pass. CI status is evidence only for the files and commit actually checked.

## Important distinction

The mathematical argument in docs/definition-and-proof.md is a paper proof from the standard subcubic graph well-quasi-order theorem. The current Lean repository does **not** yet contain a kernel-checked formalization of that graph theorem or of the whole HKN construction. The project is therefore at a real intermediate milestone, not at “fully formalized.”
