import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.DivisibilityFactorizations

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure UniqueFactorizationPackage (D : DivisibilityPackage) where
  irreducibleFactorization : Prop
  uniquenessUpToUnits : Prop
  everyNonZeroNonUnitFactors : Prop
  irreducibleFactorizationTerm : irreducibleFactorization
  uniquenessUpToUnitsTerm : uniquenessUpToUnits
  everyNonZeroNonUnitFactorsTerm : everyNonZeroNonUnitFactors

structure UniqueFactorizationEvidence {D : DivisibilityPackage} (U : UniqueFactorizationPackage D) where
  irreducibleFactorizationClosed : U.irreducibleFactorization
  uniquenessUpToUnitsClosed : U.uniquenessUpToUnits
  everyNonZeroNonUnitFactorsClosed : U.everyNonZeroNonUnitFactors

def UniqueFactorizationClosed {D : DivisibilityPackage} (U : UniqueFactorizationPackage D) : Prop :=
  U.irreducibleFactorization ∧ U.uniquenessUpToUnits ∧ U.everyNonZeroNonUnitFactors

theorem unique_factorization_closed_from_evidence {D : DivisibilityPackage} (U : UniqueFactorizationPackage D) (E : UniqueFactorizationEvidence U) :
    UniqueFactorizationClosed U := by
  exact And.intro E.irreducibleFactorizationClosed (And.intro E.uniquenessUpToUnitsClosed E.everyNonZeroNonUnitFactorsClosed)

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse