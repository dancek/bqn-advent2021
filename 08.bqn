Split ← ((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)

lines ← •FLines "08.txt"
#lines ↩ ⟨"acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"⟩
rows ← ∧⚇1' 'Split⚇1'|'Split¨lines

•Show +´⥊2‿3‿4‿7=⌜⥊≠¨> 1⊸⊑¨rows

Recognize ← {𝕊 ps:
  Len ← {𝕩=≠¨ps}
  Contains ← {∧´¨𝕩⊸∊¨ps}
  Consists ← {∧´¨∊⟜𝕩¨ps}
  NotEq ← {𝕩⊸≢¨ps}
  N ← {⊑𝕩/ps}
  n1 ← N Len 2
  n4 ← N Len 4
  n7 ← N Len 3
  n8 ← N Len 7
  n3 ← N (Len 5) ∧ Contains n1
  n9 ← N (Len 6) ∧ Contains n4
  n0 ← N (NotEq n9) ∧ (Len 6) ∧ Contains n1
  n6 ← N (NotEq n0) ∧ (NotEq n9) ∧ Len 6
  n5 ← N (Consists n6) ∧ Len 5
  n2 ← N (NotEq n3) ∧ (NotEq n5) ∧ Len 5
  n0‿n1‿n2‿n3‿n4‿n5‿n6‿n7‿n8‿n9
}

ParseNumber ← {𝕊 patterns‿out:
  ns ← Recognize patterns
  +´(⌽10⋆↕4)×ns⊐out
}

•Show +´ParseNumber¨rows
