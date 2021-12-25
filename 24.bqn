in ← •FLines "24.txt"
# Here, apply understanding of the structure of the input.
# See https://github.com/dphilipson/advent-of-code-2021/blob/master/src/days/day24.rs

reps ← 14‿∘⥊in
checks ← •BQN¨6↓¨5⊏˘reps
offsets ← •BQN¨6↓¨15⊏˘reps
rules ← ⍉(↕14)∾checks≍offsets

Run ← {𝕊 rules:
  stack ← ⟨⟩
  out ← ⟨⟩
  {𝕊 i‿c‿o:
    {c>0 ?
      stack ↩ (<i‿o)∾stack
    ;
      a‿b ← ⊑stack
      stack ↩ 1↓stack
      d ← b+c
      out ∾↩ <i‿(1⌈1+d)‿(9⌊9+d)
      out ∾↩ <a‿(1⌈1-d)‿(9⌊9-d)
    }
    0
  }˘rules
  >out
}

# index + valid range of each digit
ranges ← ∧Run rules

•Show '0'+2⊏˘ranges
•Show '0'+1⊏˘ranges
