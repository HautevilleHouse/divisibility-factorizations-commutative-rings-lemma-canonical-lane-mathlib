import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DivisibilityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse