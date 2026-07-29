import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean

structure DivisibilityStructure where
  ring : Type u
  addition : ring → ring → ring
  multiplication : ring → ring → ring
  zero : ring
  one : ring
  additiveGroup : AddGroup ring
  multiplicativeMonoid : Monoid ring
  commRing : CommRing ring
  divides : ring → ring → Prop
  unitGroup : Subgroup (Units ring)
  irreducible : ring → Prop
  prime : ring → Prop
  dividesReflexive : ∀ a : ring, divides a a
  dividesTransitive : ∀ a b c : ring, divides a b → divides b c → divides a c
  unitDivisibility : ∀ a : ring, a ∈ unitGroup → ∃ u : Units ring, a = u.val

divisibility_structure_defined : Prop := True

end DivisibilityFactorizationsCommutativeRingsLemmaCanonicalLaneLean
end HautevilleHouse