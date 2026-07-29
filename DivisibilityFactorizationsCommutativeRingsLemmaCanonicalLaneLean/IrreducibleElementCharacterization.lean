import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.UniqueFactorizationDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure IrreducibleElementCharacterization {R : Type u} [CommRing R] (D : DivisibilityStructure) where
  irreduciblePrimeEquivalence : ∀ (a : R), D.irreducible a ↔ D.prime a
  factorizationExistence : ∀ (a : R), a ≠ 0 → (∃ (fs : List R), (∀ f ∈ fs, D.irreducible f) ∧ fs.prod = a)
  characterizationClosed : Prop := irreduciblePrimeEquivalence ∧ factorizationExistence

structure IrreducibleElementCharacterizationEvidence {R : Type u} [CommRing R] (D : DivisibilityStructure) (C : IrreducibleElementCharacterization D) where
  irreduciblePrimeEquivalenceClosed : C.irreduciblePrimeEquivalence
  factorizationExistenceClosed : C.factorizationExistence

def IrreducibleElementCharacterizationClosed {R : Type u} [CommRing R] {D : DivisibilityStructure} (C : IrreducibleElementCharacterization D) : Prop :=
  C.irreduciblePrimeEquivalence ∧ C.factorizationExistence

theorem irreducible_element_characterization_closed_from_evidence {R : Type u} [CommRing R] {D : DivisibilityStructure} (C : IrreducibleElementCharacterization D) (E : IrreducibleElementCharacterizationEvidence D C) :
  IrreducibleElementCharacterizationClosed C := by
  exact ⟨E.irreduciblePrimeEquivalenceClosed, E.factorizationExistenceClosed⟩

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse