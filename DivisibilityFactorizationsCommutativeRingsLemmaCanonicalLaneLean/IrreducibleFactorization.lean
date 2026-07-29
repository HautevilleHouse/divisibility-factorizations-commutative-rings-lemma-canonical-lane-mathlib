import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean.DivisibilityStructure

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure IrreducibleFactorization {R : Type u} [CommRing R] (D : DivisibilityStructure) where
  element : R
  factors : List R
  eachIrreducible : ∀ f ∈ factors, D.irreducible f
  productEqualsElement : (factors.map (λ x : R => x)).prod = element
  factorizationExists : D.divides element 0 ∨ (∃ (fs : List R), (∀ f ∈ fs, D.irreducible f) ∧ (fs.prod = element)) 

theorem irreducible_factorization_to_admissible_class {R : Type u} [CommRing R] (D : DivisibilityStructure) (f : IrreducibleFactorization D) : 
  ∃ (A : AdmissibleClass), True := by
  refine ⟨{ object := (),
           endpointSatisfied := f.factorizationExists,
           remainderRecorded := True,
           gateWitness := Or.inl f.factorizationExists }, trivial⟩

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse