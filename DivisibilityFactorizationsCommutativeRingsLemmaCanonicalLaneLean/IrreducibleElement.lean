import DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.EuclideanDomain

/-!
# Irreducible Element Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure IrreducibleElementPackage (D : DivisorDomain) where
  irreducibleDef : D.carrier → Prop
  primeImpliesIrreducible : ∀ a : D.carrier, Prime a → irreducibleDef a
  irreducibleImpliesPrimeInUFD : (∀ a : D.carrier, irreducibleDef a → Prime a) → Prop
  factorizationIntoIrreducibles : ∀ a : D.carrier, a ≠ 0 → ¬ IsUnit a →
    ∃ (n : ℕ) (irrs : Fin n → D.carrier), (∀ i, irreducibleDef (irrs i)) ∧ a = ∏ i, irrs i

structure IrreducibleElementEvidence (D : DivisorDomain)
    (I : IrreducibleElementPackage D) where
  primeIrreducibleImplied : ∀ a : D.carrier, Prime a → I.irreducibleDef a
  irreduciblePrimeInUFD : (∀ a : D.carrier, I.irreducibleDef a → Prime a) → Prop
  factorizationExists : ∀ a : D.carrier, a ≠ 0 → ¬ IsUnit a →
    ∃ (n : ℕ) (irrs : Fin n → D.carrier), (∀ i, I.irreducibleDef (irrs i)) ∧ a = ∏ i, irrs i

def IrreducibleElementClosed (D : DivisorDomain)
    (I : IrreducibleElementPackage D) : Prop :=
  (∀ a : D.carrier, Prime a → I.irreducibleDef a) ∧
  (∀ a : D.carrier, I.irreducibleDef a → Prime a) ∧
  (∀ a : D.carrier, a ≠ 0 → ¬ IsUnit a →
    ∃ (n : ℕ) (irrs : Fin n → D.carrier), (∀ i, I.irreducibleDef (irrs i)) ∧ a = ∏ i, irrs i)

theorem irreducible_element_closed_from_evidence (D : DivisorDomain)
    (I : IrreducibleElementPackage D) (Ev : IrreducibleElementEvidence D I) :
    IrreducibleElementClosed D I := by
  have h1 : ∀ a : D.carrier, Prime a → I.irreducibleDef a := Ev.primeIrreducibleImplied
  have h2 : (∀ a : D.carrier, I.irreducibleDef a → Prime a) := by
    intro a hirr
    exact (Ev.irreduciblePrimeInUFD (fun a' h' => h' a hirr)).a
  have h3 : ∀ a : D.carrier, a ≠ 0 → ¬ IsUnit a →
    ∃ (n : ℕ) (irrs : Fin n → D.carrier), (∀ i, I.irreducibleDef (irrs i)) ∧ a = ∏ i, irrs i :=
    Ev.factorizationExists
  exact And.intro h1 (And.intro h2 h3)

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse