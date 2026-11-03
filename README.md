# Hakui Koyori Number（博衣こより数）

**A long-term, Lean-verified googology project inspired by Hakui Koyori's researcher identity.**

- Repository: [2503140kcsk-eng/E](https://github.com/2503140kcsk-eng/E)
- Project name: **Hakui Koyori Number (HKN)**
- Working date: 2026-11-03
- Status: **Definition selected; paper proof of the SCG(13) lower bound written; Lean formalization is at the arithmetic-kernel milestone.**

## Mathematical idea

Friedman's subcubic graph number \(\mathrm{SCG}(13)\) is the maximum length of a bad sequence of finite subcubic graphs \(G_1,\ldots,G_n\), where \(|V(G_i)|\le i+13\) and no earlier graph is homeomorphically embeddable into a later graph. Friedman explicitly allows loops and multiple edges.

We define a finite family of **experiment-tagged subcubic graphs**. Let

\[
T_0=1,\qquad T_{r+1}=2^{T_r},\qquad Q=T_{2000}+2.
\]

An object is a pair \((c,G)\), where \(c\in\{0,\ldots,Q-1\}\) is an experiment-batch identifier and \(G\) is a finite subcubic graph. Define

\[
(c,G)\preceq_Q(d,H)
\quad\Longleftrightarrow\quad
c=d\;\text{ and }\;G\text{ is homeomorphically embeddable into }H.
\]

**Hakui Koyori Number** is the maximum length of a sequence
\((c_1,G_1),\ldots,(c_m,G_m)\) such that

1. \(|V(G_i)|\le i+13\) for every position \(i\);
2. there are no \(i<j\) with \((c_i,G_i)\preceq_Q(c_j,G_j)\).

The full specification and proof are in [docs/definition-and-proof.md](docs/definition-and-proof.md).

## Main theorem (paper proof)

The finite-tagged class is well-quasi-ordered: in any infinite sequence, some one of the finitely many tags occurs infinitely often, and the untagged subcubic graph well-quasi-order then gives an earlier-to-later embedding. Since there are only finitely many graph isomorphism types below each vertex bound, the tree of bad prefixes is finitely branching. König's lemma therefore makes that tree finite, so the maximum defining HKN exists.

If \(L=\mathrm{SCG}(13)\), take a maximal SCG sequence and repeat it once for each of the \(Q\) tags. Different tags cannot embed into one another; within a tag, the original SCG condition applies. The shifted vertex bounds only become looser. Hence

\[
\boxed{\mathrm{HKN}\ge Q\cdot\mathrm{SCG}(13)>\mathrm{SCG}(13).}
\]

Thus the lower-bound ratio is at least \(Q=T_{2000}+2\), a 2-power tower of height 2000 plus two. The HKN definition does **not** use SCG(13) as an input; SCG(13) appears only in the comparison proof.

## Why the Koyori theme?

Hololive's official profile describes Hakui Koyori as holoX's researcher, emphasizes her curiosity and human observation, names the fans “こよりの助手くん”, and gives her dream as “すべての夢を叶えること！”. The finite tags are interpreted as independent research/experiment batch IDs; this is our mathematical design, not an official Hololive setting.

Primary theme source: [Hololive official profile – 博衣こより](https://hololive.hololivepro.com/talents/hakui-koyori/).

## Formalization status — read carefully

The current Lean source proves the final **arithmetic implication**: if the graph-theoretic construction supplies \(Q\cdot\mathrm{SCG}(13)\le\mathrm{HKN}\), then HKN is strictly larger than SCG(13). The graph model, well-quasi-order argument, finite-prefix tree, maximum construction, and tagged-copy lemma are **not yet fully formalized in Lean**.

No sorry or hand-written axiom is used in the current Lean arithmetic file. That fact must not be mistaken for a completed formal proof of the whole graph theorem. The current GitHub Actions job is the first reproducible Lean build check; its result will be reported separately.

See [docs/formalization-status.md](docs/formalization-status.md) for the exact proof boundary and next milestones.

## Build

The project is pinned to the Lean toolchain used by the current Mathlib4 default branch on 2026-11-03. It currently has no external Lean package dependency.

~~~sh
lake build
~~~

GitHub Actions runs the build and an axiom audit on pushes and pull requests.

## Project rules

- Separate definitions, mathematical proof, Lean proof, and CI evidence.
- No sorry, admit, unreviewed axioms, or claims of proof from numerical experiments.
- A graph-minor/WQO theorem must be stated with its exact hypotheses and formally imported or proved before the final Lean theorem is called complete.
- Upstream repositories are research tools, not delegated agents or proof authorities.
- This is a long-term project: the candidate may be revised if a proof gap or a stronger construction is found.
