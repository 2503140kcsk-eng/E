# Research and tool assignments

The following assignments are research roles. They do not imply that an upstream maintainer, external repository, or plugin is running a delegated task. The listed upstream repositories are currently read-only from this GitHub connection; only this repository is writable.

## Connected plugins

- **GitHub:** source of truth for versioned definitions, Lean files, issues, and CI evidence. Writes in this session target only this repository.
- **Parallel Search:** discover primary papers, official sources, and current documentation. The primary SCG definition found is Friedman's 2006 FOM 279 post.
- **Context7:** check current Lean 4, Lake, and Mathlib APIs before writing formalization code. Current Mathlib's lean-toolchain file reports leanprover/lean4:v4.36.0-rc2 on 2026-11-03.
- **Wolfram:** independent arithmetic/symbolic sanity checks for finite recurrence definitions. It returned no useful SCG(13) result, so it is not used as evidence for the comparison theorem.
- **Sider Scholar:** academic discovery and source collection. The SCG-specific Scholar/OpenAlex search returned no paper records; the primary FOM archive source is used instead. No unsupported paper citation is inferred.

## Upstream repository roles

| Repository | Assigned role in HKN | Boundary |
|---|---|---|
| [flintlib/flint](https://github.com/flintlib/flint) | Exact integer, polynomial, and bit-level arithmetic experiments for tower parameters and finite encodings. | Numeric implementation support, not a proof of the graph WQO theorem. |
| [MeniRosenfeld/TransfiniteOrdinalCalculator](https://github.com/MeniRosenfeld/TransfiniteOrdinalCalculator) | Explore Cantor-normal-form ordinal expressions below \(\varepsilon_0\). | Its README explicitly limits its represented ordinal system to \(\varepsilon_0\); do not use it to claim a comparison with SCG(13). |
| [koteitan/basmat-2.x](https://github.com/koteitan/basmat-2.x) | Explore Bashicu Matrix System BM2 notation as an alternative presentation layer. | Not a proof assistant; notation output is not proof. |
| [hypcos/incremental-googology](https://github.com/hypcos/incremental-googology) | Survey fast-growing hierarchies, ordinal notations, and googological notation design. | Game/catalog implementation is not an independently checked theorem. |
| [bbchallenge/bbchallenge-proofs](https://github.com/bbchallenge/bbchallenge-proofs) | Study reproducible proofs of Turing-machine halting/non-halting and the project's proof-audit conventions. | Its README describes plain-English proofs and future Lean/Coq translation; do not claim its files formalize HKN. |
| [jeff87654/busy-beaver](https://github.com/jeff87654/busy-beaver) | Examine Coq-checked Busy Beaver machine bounds and exact finite machine witnesses as a possible later comparison route. | Machine-specific Coq results do not transfer automatically to Lean or to HKN. |
| [google-deepmind/cryptids](https://github.com/google-deepmind/cryptids) | Reuse ideas for Lean 4 Turing-machine semantics and kernel-checked halting proofs. | Its current toolchain differs from this project; port definitions, not compiled artifacts. |
| [Singular/Singular](https://github.com/Singular/Singular) | Optional algebraic encoding/finite polynomial experiments for graph gadget constructions. | Not needed for the primary combinatorial proof. |
| [Macaulay2/M2](https://github.com/Macaulay2/M2) | Independent algebraic computations if graph gadgets are later encoded algebraically. | Not a graph-minor theorem prover. |
| [gap-system/gap](https://github.com/gap-system/gap) | Finite group/symmetry calculations for graph automorphisms and isomorphism-reduction experiments. | Computations can check finite cases only. |
| [sympy/sympy](https://github.com/sympy/sympy) | Symbolic sanity checks of recurrence expressions and small finite encodings. | Not the trusted proof kernel. |
| [sagemath/sage](https://github.com/sagemath/sage) | Finite graph enumeration, graph isomorphism, and experiment validation. | Experimental outputs are not WQO proofs. |
| [naproche/naproche](https://github.com/naproche/naproche) | Maintain readable mathematical prose and investigate natural-language proof formalization. | Its output must still be checked against the exact HKN definitions. |
| [cvc5/cvc5](https://github.com/cvc5/cvc5) | Check finite SAT/SMT encodings of graph embeddings and small counterexamples. | Cannot establish an unbounded well-quasi-order theorem by finite search. |
| [lean-dojo/LeanDojo-v2](https://github.com/lean-dojo/LeanDojo-v2) | Search Mathlib theorem names and suggest proof steps for Lean. | Suggestions are untrusted until Lean's kernel checks the resulting term. |
| [leanprover-community/mathlib4](https://github.com/leanprover-community/mathlib4) | Primary library target for finite types, lists, well-founded relations, and combinatorics. | No complete subcubic graph-minor WQO formalization has yet been located for this project. |

## Verification policy

1. Upstream code and tool output are evidence for their own capabilities, not evidence that HKN is proved.
2. Finite experiments may discover counterexamples or check encodings, but they cannot replace the infinite WQO argument.
3. Lean's kernel is authoritative for Lean declarations; CI only certifies a particular commit and workflow configuration.
4. If the graph-minor theorem remains an unformalized imported premise, the final result must be labeled conditional rather than fully formalized.
