While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

# target area: x=20..30, y=-10..-5
x0‿x1‿y0‿y1 ← 20‿30‿¯10‿¯5
# target area: x=241..273, y=-97..-63
x0‿x1‿y0‿y1 ↩ 241‿273‿¯97‿¯63

Hit ← {𝕊 ·‿·‿x‿y: (x0 ≤ x) ∧ (x ≤ x1) ∧ (y0 ≤ y) ∧ (y ≤ y1)}

Out ← {𝕊 ·‿·‿x‿y: (x1 ≤ x) ∨ (y ≤ y0)}

Step ← {𝕊 vx‿vy‿x‿y:
  (vx-×vx)‿(vy-1)‿(x+vx)‿(y+vy)
}

MaxY ← {𝕊 vx‿vy:
  state ← vx‿vy‿0‿0
  max ← 0
  While {𝕤⋄ (¬Hit state) ∧ ¬Out state}‿{𝕤
    max ⌈↩ 3⊑state
    state ↩ Step state
  }
  {Hit state ? max ; ¯100}
}

# guessed possible range
tries ← (↕275)∾⌜100-↕200
tops ← ⥊MaxY¨tries
•Show ⌈´tops
•Show +´¯100<tops
