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
Features ⊑ scanners

Hash ← {∧|¨⥊𝕩}

# this only works if the nearest two beacons to a beacon are never cut off 🤷
•Show ≠⍷∧Hash˘∾´Features¨scanners

# TODO: recognize points by feature hashes, then match rotations and translations to deduce scanner positions
