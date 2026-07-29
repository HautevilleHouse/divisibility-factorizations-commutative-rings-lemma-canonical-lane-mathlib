import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.MathlibObjects

/-!
# Unique Factorization Domain Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure UFDPackage where
  domain : DivisibilitySpace
  integralDomain : Prop
  existenceFactorization : Prop
  uniquenessFactorization : Prop
  irreduciblePrimeEquivalence : Prop

structure UFDEvidence (U : UFDPackage) where
  integralDomainClosed : U.integralDomain
  existenceFactorizationClosed : U.existenceFactorization
  uniquenessFactorizationClosed : U.uniquenessFactorization
  irreduciblePrimeEquivalenceClosed : U.irreduciblePrimeEquivalence

def UFDClosed (U : UFDPackage) : Prop :=
  U.integralDomain ∧ U.existenceFactorization ∧ U.uniquenessFactorization ∧ U.irreduciblePrimeEquivalence

theorem ufd_closed_from_evidence (U : UFDPackage) (E : UFDEvidence U) : UFDClosed U := by
  exact And.intro E.integralDomainClosed
    (And.intro E.existenceFactorizationClosed
      (And.intro E.uniquenessFactorizationClosed E.irreduciblePrimeEquivalenceClosed))

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse