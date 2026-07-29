import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure GCDDomainPackage (R : Type u) [CommRing R] where
  gcdExists : ∀ (a b : R), (∃ (d : R), (d ∣ a) ∧ (d ∣ b) ∧ ∀ (c : R), (c ∣ a) → (c ∣ b) → (c ∣ d))
  lcmExists : ∀ (a b : R), (∃ (m : R), (a ∣ m) ∧ (b ∣ m) ∧ ∀ (n : R), (a ∣ n) → (b ∣ n) → (m ∣ n))
  gcdLcmRelationship : ∀ a b, (gcd a b) * (lcm a b) = a * b

structure GCDDomainEvidence {R : Type u} [CommRing R] (G : GCDDomainPackage R) where
  gcdExistsClosed : G.gcdExists
  lcmExistsClosed : G.lcmExists
  gcdLcmRelationshipClosed : G.gcdLcmRelationship

def GCDDomainClosed {R : Type u} [CommRing R] (G : GCDDomainPackage R) : Prop :=
  G.gcdExists ∧ G.lcmExists ∧ G.gcdLcmRelationship

theorem gcd_domain_closed_from_evidence {R : Type u} [CommRing R] (G : GCDDomainPackage R) (E : GCDDomainEvidence G) : GCDDomainClosed G := by
  exact And.intro E.gcdExistsClosed (And.intro E.lcmExistsClosed E.gcdLcmRelationshipClosed)

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse