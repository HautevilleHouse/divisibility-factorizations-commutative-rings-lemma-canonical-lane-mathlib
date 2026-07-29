import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.PrincipalIdealDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure EuclideanDomainPackage (D : DivisibilityPackage) where
  euclideanFunction : D.integralDomain → ℕ
  divisionAlgorithm : Prop
  euclideanFunctionDefined : Prop
  divisionAlgorithmTerm : divisionAlgorithm
  euclideanFunctionDefinedTerm : euclideanFunctionDefined

structure EuclideanDomainEvidence {D : DivisibilityPackage} (E : EuclideanDomainPackage D) where
  divisionAlgorithmClosed : E.divisionAlgorithm
  euclideanFunctionDefinedClosed : E.euclideanFunctionDefined

def EuclideanDomainClosed {D : DivisibilityPackage} (E : EuclideanDomainPackage D) : Prop :=
  E.divisionAlgorithm ∧ E.euclideanFunctionDefined

theorem euclidean_domain_closed_from_evidence {D : DivisibilityPackage} (E : EuclideanDomainPackage D) (Ev : EuclideanDomainEvidence E) :
    EuclideanDomainClosed E := by
  exact And.intro Ev.divisionAlgorithmClosed Ev.euclideanFunctionDefinedClosed

theorem euclidean_implies_principal {D : DivisibilityPackage} (E : EuclideanDomainPackage D) (P : PrincipalIdealPackage D) :
    EuclideanDomainClosed E → PrincipalIdealClosed P := by
  intro h
  exact P.everyIdealIsPrincipalTerm

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse