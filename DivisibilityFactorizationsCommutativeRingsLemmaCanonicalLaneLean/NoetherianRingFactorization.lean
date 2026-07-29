import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure NoetherianRingPackage (R : Type u) [CommRing R] where
  ascendingChainCondition : ∀ (I : ℕ → Ideal R), (∀ n, I n ≤ I (n+1)) → (∃ N, ∀ n ≥ N, I n = I N)
  finiteGeneration : ∀ (I : Ideal R), (∃ (S : Set R), S.Finite ∧ I = Submodule.span S)
  primaryDecomposition : ∀ (I : Ideal R), (∃ (P : List (Ideal R)), (∀ p ∈ P, p.IsPrimary) ∧ I = (⋂ p ∈ P, p) ∧ (∀ p, ∀ q, p ≠ q → p ⊔ q = 1))

structure NoetherianRingEvidence {R : Type u} [CommRing R] (N : NoetherianRingPackage R) where
  ascendingChainConditionClosed : N.ascendingChainCondition
  finiteGenerationClosed : N.finiteGeneration
  primaryDecompositionClosed : N.primaryDecomposition

def NoetherianRingClosed {R : Type u} [CommRing R] (N : NoetherianRingPackage R) : Prop :=
  N.ascendingChainCondition ∧ N.finiteGeneration ∧ N.primaryDecomposition

theorem noetherian_ring_closed_from_evidence {R : Type u} [CommRing R] (N : NoetherianRingPackage R) (E : NoetherianRingEvidence N) : NoetherianRingClosed N := by
  exact And.intro E.ascendingChainConditionClosed (And.intro E.finiteGenerationClosed E.primaryDecompositionClosed)

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse