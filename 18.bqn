in ← •FLines "18.txt"

_fix ← {𝕩≡𝕨𝔽𝕩 ? 𝕩 ; 𝕨𝕊𝕨𝔽𝕩}

ParseLine ← {𝕊 line:
  depth ← 0
  arr ← ⟨⟩
  {'[': depth +↩ 1;
   ']': depth -↩ 1;
   ',': 0;
   arr ∾↩ <depth‿(𝕩-'0')
  }¨line
  >arr
}

Display ← {𝕊 arr:
  s ← ""
  idx ← 0
  depth ← 0
  {𝕊 d‿v:
    {d ≠ depth ?
      s ∾↩ (|d-depth)⥊{d>depth ? '[' ; ']'}
      depth ↩ d
    ; @}
    s ∾↩ '0'+v
    @
  }˘arr
  s ∾ depth⥊']'
}

Explode ← {𝕊 data:
  l ← ≠data
  i ← ⊑⊐⟜1 (5⊸≤∧«=⊢) ⊏˘data
  {i=l ? data;
    d ← ⊑i⊏data
    V ← {𝕩‿1⊑data}
    head ← {0<i ? ((i-1)↑data) ∾ (0‿(V i))+(i-1)⊏data; ↕0‿2}
    tail ← {l>i+2 ? ((0‿(V i+1))+(i+2)⊏data) ∾ (i+3)↓data; ↕0‿2}
    head ∾ ⟨d-1,0⟩ ∾ tail
  }
}

Split ← {𝕊 data:
  i ← ⊑⊐⟜1 9<1⊏˘data
  {i=≠data ? data;
    d‿v ← i⊏data
    a ← ⌊v÷2
    b ← ⌈v÷2
    (i↑data) ∾ (d+1)‿a ∾ (d+1)‿b ∾ ((i+1)↓data)}
}
Reduce ← (Split Explode _fix) _fix

Add ← {Reduce 1‿0⊸+˘𝕩∾𝕨}´⌽

Magnitude1 ← {𝕊 data:
  {1=≠data ? data ;
    m ← ⌈´⊏˘data
    i ← ⊑⊐⟜1 m=⊏˘data
    d‿a ← i⊏data
    ·‿b ← (i+1)⊏data
    
    (i↑data) ∾ (d-1)‿((3×a)+2×b) ∾ ((i+2)↓data)}
}
Magnitude ← 0‿1⊑ Magnitude1 _fix

ds←ParseLine¨in
•Show Magnitude Add ds

pairs ← ∾´{𝕩∾¨↕𝕩}¨↕≠ds
•Show ⌈´⥊Magnitude∘Add∘⊏⟜ds¨pairs
