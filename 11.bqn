While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

in ← >'0'-˜⟨
  "5483143223"
  "2745854711"
  "5264556173"
  "6141336146"
  "6357385478"
  "4167524645"
  "2176841721"
  "6882881134"
  "4846848554"
  "5283751526"
⟩
in ↩ >'0'-˜•FLines "11.txt"

flashTotal ← 0
Step ← {𝕊 grid:
  flashed ← 0×grid
  grid ↩ 1+grid
  While {𝕤 ⋄ flashed ≢ 9<grid}‿{𝕤
    flashing ← (¬flashed) ∧ 9<grid
    flashed ↩ flashed ∨ flashing
    # adjacent squares: shift in both dirs
    inc ← (⊢+«+»)˘(⊢+«+»)flashing
    grid ↩ grid+inc
  }
  flashTotal ↩ flashTotal + +´⥊flashed
  grid×grid≤9
}

Step⍟100 in
•Show flashTotal

s ← 0
g ← in
While {𝕤 ⋄ 0≠+´⥊g}‿{𝕤
  s↩s+1
  g↩Step g
}
•Show s
