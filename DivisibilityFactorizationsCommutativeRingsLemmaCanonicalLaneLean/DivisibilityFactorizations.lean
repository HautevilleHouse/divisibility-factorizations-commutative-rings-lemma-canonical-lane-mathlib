import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure DivisibilityPackage where
  integralDomain : Type u
  integralDomainStructure : CommRing integralDomain
  isDomain : Prop
  noZeroDivisors : Prop
  isDomainTerm : isDomain
  noZeroDivisorsTerm : noZeroDivisors

structure DivisibilityEvidence (D : DivisibilityPackage) where
  integralDomainCarrier : D.isDomain
  noZeroDivisorsEvidence : D.noZeroDivisors

def DivisibilityClosed (D : DivisibilityPackage) : Prop :=
  D.isDomain ∧ D.noZeroDivisors

theorem divisibility_closed_from_evidence (D : DivisibilityPackage) (E : DivisibilityEvidence D) :
    DivisibilityClosed D := by
  exact And.intro E.integralDomainCarrier E.noZeroDivisorsEvidence

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse