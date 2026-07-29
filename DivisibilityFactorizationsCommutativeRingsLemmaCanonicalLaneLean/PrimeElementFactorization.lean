import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure PrimeFactorizationPackage (R : Type u) [CommRing R] where
  unitsGroup : Type v
  irreducibleElements : Set R
  factorizationExists : ∀ (a : R), a ≠ 0 → (∃ (u : unitsGroup) (p : List R), (∀ p' ∈ p, irreducibleElements.Contains p') ∧ a = (u : R) * (p.prod))
  uniquenessUpToUnits : ∀ a, a ≠ 0 → ∀ (u1 u2 : unitsGroup) (p1 p2 : List R), (∀ p' ∈ p1, irreducibleElements.Contains p') ∧ (∀ p' ∈ p2, irreducibleElements.Contains p') ∧ a = (u1 : R) * (p1.prod) ∧ a = (u2 : R) * (p2.prod) → (∃ (perm : List.Perm p1 p2), (∀ i, (p1.nthLe i).Associates (p2.nthLe (perm i))) ∧ (u1 = u2))

structure PrimeFactorizationEvidence {R : Type u} [CommRing R] (P : PrimeFactorizationPackage R) where
  factorizationExistsClosed : P.factorizationExists
  uniquenessUpToUnitsClosed : P.uniquenessUpToUnits

def PrimeFactorizationClosed {R : Type u} [CommRing R] (P : PrimeFactorizationPackage R) : Prop :=
  P.factorizationExists ∧ P.uniquenessUpToUnits

theorem prime_factorization_closed_from_evidence {R : Type u} [CommRing R] (P : PrimeFactorizationPackage R) (E : PrimeFactorizationEvidence P) : PrimeFactorizationClosed P := by
  exact And.intro E.factorizationExistsClosed E.uniquenessUpToUnitsClosed

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse