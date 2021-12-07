in ← •FChars "07.txt"
ns ← ∧•BQN ∾"⟨"‿in‿"⟩"
median ← (1-˜⌈2÷˜≠ns)⊑ns
Cost ← {+´|ns-𝕩}

•Show Cost median

Cost2 ← {
  diffs ← |ns-𝕩
  costs ← (diffs×(diffs+1))÷2
  +´costs
}
# The second cost is optimized near the average but not
# exactly it. Since I don't understand the related
# mathematics, just compute all possible costs and pick the
# minimum (argh).
candidates ← ↕⌈´ns
•Show ⌊´Cost2¨candidates
