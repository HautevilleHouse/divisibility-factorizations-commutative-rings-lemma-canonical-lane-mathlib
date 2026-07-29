import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure DivisorFamily (R : Type u) [CommRing R] where
  elements : Set (R × R)
  nonempty : elements.Nonempty
  divisorCondition : ∀ (a b : R), (a, b) ∈ elements → a ∣ b

structure DivisibilityFactorizationPackage (R : Type u) [CommRing R] where
  divisorFamily : DivisorFamily R
  factorization : R → List (R × R)
  factorizationProperty : ∀ (r : R), r = (List.prod (factorization r).map (λ (p, e) => p ^ e))
  factorizationUnique : ∀ (f g : List (R × R)), r = (List.prod (f.map (λ (p, e) => p ^ e))) = r = (List.prod (g.map (λ (p, e) => p ^ e))) → f = g

structure DivisibilityFactorizatonEvidence {R : Type u} [CommRing R] (Pkg : DivisibilityFactorizationPackage R) where
  divisorFamilyNonemptyClosed : Pkg.divisorFamily.nonempty
  factorizationPropertyClosed : ∀ (r : R), Pkg.factorizationProperty r
  factorizationUniqueClosed : ∀ (f g : List (R × R)), Pkg.factorizationUnique f g

def DivisibilityFactorizatonClosed {R : Type u} [CommRing R] (Pkg : DivisibilityFactorizationPackage R) : Prop :=
  Pkg.divisorFamily.nonempty ∧ (∀ (r : R), Pkg.factorizationProperty r) ∧ (∀ (f g : List (R × R)), Pkg.factorizationUnique f g)

theorem divisibility_factorization_closed_from_evidence {R : Type u} [CommRing R] (Pkg : DivisibilityFactorizationPackage R) (E : DivisibilityFactorizatonEvidence Pkg) : DivisibilityFactorizatonClosed Pkg := by
  exact And.intro E.divisorFamilyNonemptyClosed (And.intro E.factorizationPropertyClosed E.factorizationUniqueClosed)

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse