import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DivisibilityAdmittedObject where
  ring : Type u
  ringStructure : CommRing ring
  isIntegralDomain : Prop
  factorizationProperties : Prop
  conclusion : factorizationProperties

structure DivisibilityEndgameState where
  object : DivisibilityAdmittedObject

def DivisibilityWitnessClosed (O : DivisibilityAdmittedObject) : Prop :=
  O.factorizationProperties

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse