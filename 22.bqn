Split ← ((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)
in ← •FLines "22.txt"

ParseLine ← {𝕊 line:
  v‿rest ← ' 'Split line
  axes ← ','Split rest
  cube ← ⍉>{•BQN¨'.'Split 1⊑'='Split 𝕩}¨axes
  (v≡"on")‿cube
}

Overlap ← {((⊏𝕨)⌈⊏𝕩)≍(1⊏𝕨)⌊(1⊏𝕩)}
Overlaps ← {cube 𝕊 xs:
  os ← ⟨⟩
  {o ← cube Overlap 𝕩
   {∧´≤˝o ? os ∾↩ <o ; 0}}¨xs
  os
}
Volume ← {×´1+-˜˝𝕩}
Total ← +´Volume¨

Run ← {𝕊 data:
  pos ← ⟨⟩
  neg ← ⟨⟩

  {𝕊 dir‿cube:
    ns ← cube Overlaps neg
    neg ∾↩ cube Overlaps pos
    pos ∾↩ ns
    {dir ? pos ∾↩ <cube ; 0 }
  }¨data
  pos‿neg
}

limit ← ⍉3‿2⥊¯50‿50
data ← ParseLine¨in
p‿n ← Run data

•Show (Total limit Overlaps p) - Total limit Overlaps n
•Show (Total p) - Total n
# 588120
# 1134088247046731
