import canonicalLaneMathlib.AdmissibleClass
import DivisiblityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.UniqueFactorizationDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure GCDPropertyPackage {R : Type u} [CommRing R] where
  gcdExists : ∀ (a b : R), ∃ (d : R), (d ∣ a) ∧ (d ∣ b) ∧ ∀ (c : R), (c ∣ a) → (c ∣ b) → (c ∣ d)

structure LCMPropertyPackage {R : Type u} [CommRing R] where
  lcmExists : ∀ (a b : R), ∃ (m : R), (a ∣ m) ∧ (b ∣ m) ∧ ∀ (c : R), (a ∣ c) → (b ∣ c) → (m ∣ c)

structure GCD_LCM_BridgePackage {R : Type u} [CommRing R] (U : UFDPropertyPackage I) where
  gcdFromFactorization : ∀ (a b : R), (∀ (f g : List (R × ℕ)), factorizationProperty a f → factorizationProperty b g → gcdExists a b)
  lcmFromFactorization : ∀ (a b : R), (∀ (f g : List (R × ℕ)), factorizationProperty a f → factorizationProperty b g → lcmExists a b)
  gcdLcmRelation : ∀ (a b : R), gcdExists a b → lcmExists a b → (a * b) = (gcd * lcm) where gcd is the element from gcdExists, lcm from lcmExists

theorem gcd_lcm_bridge_closed {R : Type u} [CommRing R] (B : GCD_LCM_BridgePackage) : GCDPropertyPackage R ∧ LCMPropertyPackage R := by
  constructor
  · exact { gcdExists := λ a b => (B.gcdFromFactorization a b).1 }
  · exact { lcmExists := λ a b => (B.lcmFromFactorization a b).1 }

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse