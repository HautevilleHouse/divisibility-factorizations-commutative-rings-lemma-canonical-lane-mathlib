import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Algebra.Ring.Defs

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DivisibilitySpace where
  carrier : Type
  ring : Ring carrier

structure AdmittedObject where
  space : DivisibilitySpace
  integralDomain : Prop
  factorizationUnique : Prop
  irreducibleElement : space.carrier
  irreducibleCondition : Prop
  irreducibleIsPrime : Prop
  conclusion : factorizationUnique

structure DivisibilityEndgameState where
  object : AdmittedObject

def DivisibilityWitnessClosed (O : AdmittedObject) : Prop :=
  O.factorizationUnique

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse