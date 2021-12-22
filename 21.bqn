While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

a‿b ← 1‿3 # positions
p‿q ← 0‿0 # scores

rolls ← 0
die ← 0
Roll ← {𝕊: rolls +↩ 1 ⋄ die ↩ 1+100|die}
Turn ← {𝕊 pos: 1+10|1-˜pos + (Roll @) + (Roll @) + (Roll @)}
Step ← {𝕊:
  a Turn↩
  p +↩ a
  p < 1000 ? b Turn↩ ⋄ q +↩ b; @
}

While {𝕤 ⋄ 1000>p⌈q}‿{𝕤 ⋄ Step @}
•Show rolls×p⌊q

# star 2: completely different :D
state1 ← 1⌾⊑10‿31⥊0
win ← (10‿21⥊0)∾˘10‿10⥊1
MultiverseRoll ← {(¯1⌽𝕩)+(¯2⌽𝕩)+(¯3⌽𝕩)}
MultiverseStep ← {𝕊 st‿w:
  st ↩ >{»⍟(𝕩+1) 𝕩⊏MultiverseRoll⍟3 st}¨↕10
  w ∾↩ +´⥊win×st
  (st×¬win)‿w
}
TurnsToWin ← {1⊑MultiverseStep⍟11 ((1-𝕩)⌽state1)‿⟨⟩}

CountWins ← {𝕊 as‿bs:
  a←b←i←0
  p←1
  While {𝕤 ⋄ i<11}‿{𝕤
    a +↩ p × i⊑as
    p ↩ (p×27)-i⊑bs
    i +↩ 1
  }
  p↩1
  i↩0
  While {𝕤 ⋄ i<11}‿{𝕤
    p ↩ (27×p) - i⊑as
    b +↩ p × i⊑bs
    i +↩ 1
  }
  a‿b
}
•Show ⌈´CountWins (TurnsToWin 1)‿(TurnsToWin 3)
