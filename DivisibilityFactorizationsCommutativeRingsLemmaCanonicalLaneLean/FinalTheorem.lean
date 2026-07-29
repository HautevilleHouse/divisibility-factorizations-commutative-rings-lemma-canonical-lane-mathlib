import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

def ConstrainedDivisibilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_divisibility_endgame (A : AdmissibleClass) :
    ConstrainedDivisibilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse