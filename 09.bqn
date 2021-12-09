While ← {𝕨{𝕊∘𝔾⍟𝔽𝕩}𝕩@}´
Split ← ((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)

in ← (@+10)Split"
2199943210
3987894921
9856789892
8767896789
9899965678"
in ↩ •FLines "09.txt"

grid ← >-⟜'0'¨in

# local minimums along a single axis
LocalMinimums ← {𝕊 xs:
  # create normal 3-windows *and* windows containing ∞ for the border
  windows ← <˘(∞∾2↑xs)∾(3↕xs)∾(⌽∞∾2↑⌽xs)
  # which windows have minimum value in the middle?
  1=⊑∘⍋¨windows
}
⍋9‿4‿5
ms ← (LocalMinimums˘grid) ∧ ⍉LocalMinimums˘⍉grid

•Show +´+˝ms+ms×grid

area_ids ← (≢ms)⥊(⥊ms)×1+⊒⥊ms
areas ← area_ids + 9≠grid
Fill ← {
  0 𝕊 b: b ;
  1 𝕊 b: b ;
  a 𝕊 0: 0 ;
  a 𝕊 b: a
}
While {𝕤⋄⊑1∊⥊areas}‿{𝕤
  areas ↩ Fill`⌾(⌽∘⍉) Fill`⌾⌽ Fill`⌾⍉ Fill`areas
}

largest3 ← 3↑∨≠¨1↓⊔⥊areas
•Show ×´largest3
