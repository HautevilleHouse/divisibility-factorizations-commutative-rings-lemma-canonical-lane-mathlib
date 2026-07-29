import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure EuclideanDomainPackage (R : Type u) [CommRing R] where
  euclideanFunction : R → ℕ
  divisionAlgorithm : ∀ (a b : R), b ≠ 0 → (∃ (q r : R), a = b * q + r ∧ (r = 0 ∨ euclideanFunction r < euclideanFunction b))
  bezoutIdentity : ∀ a b, (∃ (u v : R), a * u + b * v = (gcd a b))

def euclideanFunctionWellDefined {R : Type u} [CommRing R] (E : EuclideanDomainPackage R) : Prop :=
  ∀ (a : R), E.euclideanFunction a = 0 → a = 0

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse