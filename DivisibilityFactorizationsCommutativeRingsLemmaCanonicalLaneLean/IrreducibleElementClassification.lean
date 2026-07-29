import canonicalLaneMathlib.AdmissibleClass
import DivisiblityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.DivisibilityFactorization

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure IrreducibleElementPackage {R : Type u} [CommRing R] (Pkg : DivisibilityFactorizationPackage R) where
  irreducibleSet : Set R
  irreducibilityCriterion : ∀ (a : R), a ∈ irreducibleSet ↔ (a ≠ 0 ∧ ¬ IsUnit a ∧ ∀ (b c : R), a = b * c → IsUnit b ∨ IsUnit c)
  factorizationByIrreducibles : ∀ (r : R), r ≠ 0 → ∃ (irrs : List (R × ℕ)), (∀ (p : R), p ∈ irrs.map Prod.fst → p ∈ irreducibleSet) ∧ r = (List.prod (irrs.map (λ (p, n) => p ^ n)))

structure IrreducibleElementEvidence {R : Type u} [CommRing R] {Pkg : DivisibilityFactorizationPackage R} (I : IrreducibleElementPackage Pkg) where
  irreducibilityCriterionClosed : ∀ (a : R), a ∈ I.irreducibleSet ↔ (a ≠ 0 ∧ ¬ IsUnit a ∧ ∀ (b c : R), a = b * c → IsUnit b ∨ IsUnit c)
  factorizationByIrreduciblesClosed : ∀ (r : R), r ≠ 0 → ∃ (irrs : List (R × ℕ)), (∀ (p : R), p ∈ irrs.map Prod.fst → p ∈ I.irreducibleSet) ∧ r = (List.prod (irrs.map (λ (p, n) => p ^ n)))

def IrreducibleElementClosed {R : Type u} [CommRing R] {Pkg : DivisibilityFactorizationPackage R} (I : IrreducibleElementPackage Pkg) : Prop :=
  (∀ (a : R), a ∈ I.irreducibleSet ↔ (a ≠ 0 ∧ ¬ IsUnit a ∧ ∀ (b c : R), a = b * c → IsUnit b ∨ IsUnit c)) ∧
  (∀ (r : R), r ≠ 0 → ∃ (irrs : List (R × ℕ)), (∀ (p : R), p ∈ irrs.map Prod.fst → p ∈ I.irreducibleSet) ∧ r = (List.prod (irrs.map (λ (p, n) => p ^ n))))

theorem irreducible_element_closed_from_evidence {R : Type u} [CommRing R] {Pkg : DivisibilityFactorizationPackage R} (I : IrreducibleElementPackage Pkg) (E : IrreducibleElementEvidence I) : IrreducibleElementClosed I := by
  exact And.intro E.irreducibilityCriterionClosed E.factorizationByIrreduciblesClosed

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse