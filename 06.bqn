in ← •FChars "06.txt"
#in ↩ "3,4,3,1,2"
ints ← •BQN ∾"⟨"‿in‿"⟩"

# Idea: keep state as a table of counts, eg.
# ⟨ 0 1 1 2 1 0 0 0 0 ⟩ for "3,4,3,1,2" because there are two 3s etc.
# Now we can just shift left and add the first value to
# indices 6 and 8 to get the next state. The total count of
# fish is just the sum.
counts ← +˝ints=⌜↕9
mask ← 6=↕9
Step ← (mask×⊏)+1⊸⌽

•Show +´¨Step⍟80‿256 counts
