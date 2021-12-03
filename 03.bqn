lines ← ⟨
  "00100"
  "11110"
  "10110"
  "10111"
  "10101"
  "01111"
  "00111"
  "11100"
  "10000"
  "11001"
  "00010"
  "01010"
⟩
lines ↩ •FLines "03.txt"
bs ← >'0'-˜˘lines
halflen ← 2÷˜≠bs
bitcounts ← +´˘⍉bs
gammab ← halflen < bitcounts
epsilonb ← 1-gammab

Bits_to_int ← {+´(2⋆↕≠𝕩) × ⌽𝕩}

•Show (Bits_to_int gammab) × (Bits_to_int epsilonb)

While   ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

Get_O2 ← {
  i ← 0
  xs ← 𝕩
  While {𝕤 ⋄ 1 < ≠xs}‿{𝕤
    limit ← 2÷˜≠xs
    bit ← limit ≤ i⊑ +´˘⍉xs

    matching ← bit = i⊑˘xs
    #•Show bit
    #•Show matching
    xs ↩ matching / xs
    i ↩ i+1
  }
  Bits_to_int ⥊ xs
}

Get_CO2 ← {
  i ← 0
  xs ← 𝕩
  While {𝕤 ⋄ 1 < ≠xs}‿{𝕤
    limit ← 2÷˜≠xs
    bit ← limit > i⊑ +´˘⍉xs

    matching ← bit = i⊑˘xs
    #•Show bit
    #•Show matching
    xs ↩ matching / xs
    i ↩ i+1
  }
  Bits_to_int ⥊ xs
}

•Show (Get_CO2 bs) × Get_O2 bs
