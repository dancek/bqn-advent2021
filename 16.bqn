in ← •FChars "16.txt"

Match ← {𝕏𝕨}´
While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

Bits ← {>8‿4‿2‿1¨{m←𝔽𝕩 ⋄ m≤(2×m)|𝕩} -⟜{7×⌊𝕩÷16}𝕩-'0'}
data ← ∾´Bits¨in

Int ← {+´𝕩×⌽2⋆↕≠𝕩}

ReadLiteralBits ← {
  t‿s ← 5 (↑⋈↓) 𝕩
  bs ← 1↓t
  { (¬⊑t) ? bs‿s ;
    t‿s ← ReadLiteralBits s
    (bs∾t)‿s
  }
}
ReadLiteral ← {
  bs‿s ← ReadLiteralBits 𝕩
  (Int bs)‿s
}

ReadOp ← {
  (⊑𝕩) ?
    # type 1: l is number of packets
    t‿subs ← @‿⟨⟩
    l‿s ← 11 (↑⋈↓) 1↓𝕩
    l ↩ (Int l)
    While {𝕤 ⋄ l>0}‿{𝕤
      l -↩ 1
      t‿s ↩ ReadPacket s
      subs ∾↩ <t
    }
    subs‿s
  ;
    # type 0: l is number of bits
    t‿ss‿subs ← @‿@‿⟨⟩
    l‿s ← 15 (↑⋈↓) 1↓𝕩
    ss‿s ↩ (Int l) (↑⋈↓) s
    (ReadPackets ss)‿s
}

vsum ← 0
ReadPacket ← {𝕊 s:
  d←v←t←@
  v‿s ↩ 3 (↑⋈↓) s
  t‿s ↩ 3 (↑⋈↓) s
  d‿s ↩ Match (Int t)‿{
    4: ReadLiteral s ;
    𝕩: ReadOp s
  }
  vsum +↩ (Int v)
  ((Int v)‿(Int t)‿d)‿s
}
ReadPackets ← {𝕊 s:
  p‿ps ← @‿⟨⟩
  # under 11 bits is always padding (header is 3+3 and shortest data 5 bits)
  While {𝕤 ⋄ 11≤≠s}‿{𝕤
    p‿s ↩ ReadPacket s
    ps ∾↩ <p
  }
  ps
}
ast ← ReadPackets data
•Show vsum

Eval ← {
  𝕊 v‿4‿data: data ;
  𝕊 v‿t‿data: (t ⊑ +‿×‿⌊‿⌈‿@‿>‿<‿=)´Eval¨data
}
•Show Eval ⊑ast

