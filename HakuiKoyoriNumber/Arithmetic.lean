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
def experimentCount : Nat := Nat.succ (Nat.succ (twoTower 2000))

/-- At least two distinct experiment batches exist. -/
theorem experimentCount_ge_two : 2 ≤ experimentCount := by
  exact Nat.succ_le_succ (Nat.succ_le_succ (Nat.zero_le (twoTower 2000)))

/--
Arithmetic finishing lemma for the main comparison.

The remaining graph-theoretic hypothesis hCopies is the tagged-copy lower
bound. This theorem turns that bound into strict domination; the proof
never evaluates the enormous tower.
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
  omega

end HakuiKoyoriNumber
