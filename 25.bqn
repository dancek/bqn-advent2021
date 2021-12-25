in ← >⟨
  "v...>>.vv>"
  ".vv>>.vv.."
  ">>.>v>...v"
  ">>v>>.>.v."
  "v>v.vv.v.."
  ">.>>..v..."
  ".vv..>.>v."
  "v.v..>>v.v"
  "....v..v.>"
⟩
in ↩ >•FLines "25.txt"

# naming: e(ast), s(outh), m(oving), c(lear)
e ← '>'=in
s ← 'v'=in

Ascii ← {𝕊 i‿e‿s: (e+2×s)⊏".>v"}
_fixish ← {(1↓𝕩) ≡ 1↓𝕨𝔽𝕩 ? 𝕩 ; 𝕨 𝕊 𝕨𝔽𝕩}

  Step ← {𝕊 i‿e‿s:
    me ← e∧1⌽˘¬e∨s
    e ↩ (¯1⌽˘me)∨e∧¬me
    ms ← s∧1⌽¬e∨s
    s ↩ (¯1⌽ms)∨s∧¬ms
    (i+1)‿e‿s
  }

stop ← Step _fixish 0‿e‿s
•Show 1+⊑stop
