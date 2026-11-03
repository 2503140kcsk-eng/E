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

/--
Arithmetic finishing lemma for the main comparison.

The hypotheses expose the two elementary positive-size facts and the
graph-theoretic tagged-copy lower bound. In particular, the proof never
evaluates the enormous tower.
-/
theorem strict_domination_of_copy_bound
    (scg13 koyori : Nat)
    (hPositive : 1 ≤ scg13)
    (hAtLeastTwoBatches : 2 ≤ experimentCount)
    (hCopies : experimentCount * scg13 ≤ koyori) :
    scg13 < koyori := by
  have hDouble : scg13 < 2 * scg13 := by omega
  have hScale : 2 * scg13 ≤ experimentCount * scg13 :=
    Nat.mul_le_mul_right scg13 hAtLeastTwoBatches
  omega

end HakuiKoyoriNumber
