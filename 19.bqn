Split ← ((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)

in ← (<"") ∾ •FLines "19.txt"
scanners ← >¨{•BQN "⟨"∾𝕩∾"⟩"}¨¨2↓¨1↓in⊔˜+`""⊸≡¨in

a←1‿1‿1
b←2‿3‿5

Dist2 ← {+´×˜𝕩-𝕨}
Nearest ← {v 𝕊 vs:
  vs⊏˜⍋v⊸Dist2˘ vs
}

Features ← {𝕊 vs:
  {𝕊 v:
    v⊸-˘2↑1↓v Nearest vs
  }˘vs
}

Hash ← {∧|¨⥊𝕩}

# this only works if the nearest two beacons to a beacon are never cut off 🤷
•Show ≠⍷∧Hash˘∾´Features¨scanners

# OK. Star 2. Do this properly.

# generate all rotations (and mirrorings, which doesn't matter here)
pm3 ← 1-2×⥊↕2‿2‿2
base ← 3‿3⥊1‿0‿0‿0
rotations ← ⥊pm3×˘⌜(⊢∾⌽¨)⌽⟜base¨↕3

Rotate ← {+˝𝕨×𝕩}
FindRotation ← {feat1 𝕊 feat2: rotations⊑˜/{feat1≡𝕩⊸Rotate˘feat2}¨rotations}

Run ← {points 𝕊 ⟨⟩: 1‿3⥊0;  
  points 𝕊 scs:
  # compute features and hashes
  feats ← Features points
  hashes ← Hash˘feats

  # take first unjoined scanner, compute features and hashes
  xs ← ⊑scs
  fs ← Features xs
  hs ← Hash˘fs
  matches ← hs (∊/⊣) hashes
  # if no matches, recurse with rotated scs
  {0=≠matches ? points Run 1⌽scs ;
    # take first matching hash, find its index in both `points` and `xs`
    m ← ⊏matches
    mi ← ⊑/m⊸≡˘hs
    pi ← ⊑/m⊸≡˘hashes
    mf ← mi⊏fs
    pf ← pi⊏feats
    # find rotation and translation
    rot ← pf FindRotation mf
    tr ← (pi⊏points) - rot Rotate mi⊏xs
    # transform all `xs`
    ps ← {tr + rot Rotate 𝕩}˘xs

    # recurse with joined and deduplicated points
    tr ∾ (⍷ points∾ps) Run 1↓scs
  }
}

scannerPositions ← (⊑scanners) Run 1↓scanners

Manhattan ← {+´|𝕩-𝕨}
•Show ⌈´⥊Manhattan⌜˜ <˘scannerPositions
