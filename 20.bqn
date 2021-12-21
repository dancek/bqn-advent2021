in ↩ •FLines "20.txt"
lut ← '#'=⊑in
Pad ← {{0∾˘𝕩∾˘0}⌾⍉0∾˘𝕩∾˘0}
Bin2int ← {+´(2⋆↕≠𝕩) × ⌽𝕩}
Step ← {{(Bin2int⥊𝕩)⊑lut}⎉2 3‿3↕𝕩}

# NOTE: pad count needs to be ~2x step count
grid ← Pad⍟100 '#'=>2↓in
•Show +´⥊Step⍟2 grid
•Show +´⥊Step⍟50 grid
