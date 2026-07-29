import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.UniqueFactorization

/-!
# Irreducible-Prime Bridge Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure IrreduciblePrimeBridgePackage {U : UFDPackage} where
  irreducibleImpliesPrime : Prop
  primeImpliesIrreducible : Prop
  bridgeCondition : irreducibleImpliesPrime ∧ primeImpliesIrreducible

structure IrreduciblePrimeBridgeEvidence {U : UFDPackage} (B : IrreduciblePrimeBridgePackage U) where
  irreducibleImpliesPrimeClosed : B.irreducibleImpliesPrime
  primeImpliesIrreducibleClosed : B.primeImpliesIrreducible

def IrreduciblePrimeBridgeClosed {U : UFDPackage} (B : IrreduciblePrimeBridgePackage U) : Prop :=
  B.irreducibleImpliesPrime ∧ B.primeImpliesIrreducible

theorem irreducible_prime_bridge_closed_from_evidence {U : UFDPackage}
    (B : IrreduciblePrimeBridgePackage U) (E : IrreduciblePrimeBridgeEvidence B) :
    IrreduciblePrimeBridgeClosed B := by
  exact And.intro E.irreducibleImpliesPrimeClosed E.primeImpliesIrreducibleClosed

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse