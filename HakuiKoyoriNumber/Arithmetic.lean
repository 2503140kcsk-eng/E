import Lean

namespace HakuiKoyoriNumber

/--
The binary power tower used for the experiment-batch count.

T(0) = 1 and T(n+1) = 2^(T(n)).
Thus T(2000) is a tower of 2s of height 2000.
-/
def twoTower : Nat → Nat
  | 0 => 1
  | n + 1 => 2 ^ twoTower n

/-- Number of distinct experiment-batch identifiers. -/
def experimentCount : Nat := twoTower 2000 + 2

theorem experimentCount_ge_two : 2 ≤ experimentCount := by
  dsimp [experimentCount]
  omega

/--
Arithmetic finishing lemma for the main comparison.

hCopies is the graph-theoretic lower bound still to be formalized:
the tagged-copy construction supplies at least
experimentCount * scg13 admissible terms.
This theorem proves that such a bound implies strict domination.
-/
theorem strict_domination_of_copy_bound
    (scg13 koyori : Nat)
    (hPositive : 1 ≤ scg13)
    (hCopies : experimentCount * scg13 ≤ koyori) :
    scg13 < koyori := by
  have hFactor : 2 ≤ experimentCount := experimentCount_ge_two
  have hDouble : scg13 < 2 * scg13 := by omega
  have hScale : 2 * scg13 ≤ experimentCount * scg13 :=
    Nat.mul_le_mul_right scg13 hFactor
  exact lt_of_lt_of_le hDouble (le_trans hScale hCopies)

end HakuiKoyoriNumber
