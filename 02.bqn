Match ← {𝕏𝕨}´
# parse one of "forward x", "up x" or "down x" to coordinates
Parse ← {𝕊 l:
  Match (0⊑l)‿{
    'f': (•BQN 8↓l)‿0 ;
    'd': 0‿(•BQN 5↓l) ;
    'u': 0‿(-•BQN 3↓l)
  }
}
lines ← •FLines "02.txt"
•Show ×´+´ Parse¨lines

Calculate ← {x‿y 𝕊 pos‿depth‿aim:
  (pos+x)‿(depth+aim×x)‿(aim+y)
}
pos‿depth‿aim ← 0‿0‿0 Calculate´ Parse¨⌽lines
•Show pos × depth
