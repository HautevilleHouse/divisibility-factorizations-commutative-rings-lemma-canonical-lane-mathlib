import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def divisibilityProjection : Projection DivisibilityEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem divisibility_projection_idempotent (x : DivisibilityEndgameState) :
    divisibilityProjection.toFun (divisibilityProjection.toFun x) = divisibilityProjection.toFun x := by
  exact divisibilityProjection.idempotent x

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse