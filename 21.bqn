While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

a‿b ← 1‿3 # positions
p‿q ← 0‿0 # scores

rolls ← 0
die ← 0
Roll ← {𝕊: rolls +↩ 1 ⋄ die ↩ 1+100|die}
Turn ← {𝕊 pos: 1+10|1-˜pos + (Roll @) + (Roll @) + (Roll @)}
Step ← {𝕊:
  a Turn↩
  p +↩ a
  p < 1000 ? b Turn↩ ⋄ q +↩ b; @
}

While {𝕤 ⋄ 1000>p⌈q}‿{𝕤 ⋄ Step @}
•Show rolls×p⌊q
