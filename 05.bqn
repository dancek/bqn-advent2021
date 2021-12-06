Split ← ((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)
in ← (@+10) Split "0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2"
in ↩ •FLines "05.txt"

coordpairs ← •BQN⚇1 ','Split¨¨1‿0‿1⊸/¨' 'Split¨in
Line ← {𝕊 a‿b:
  dir ← ×b-a
  len ← ⌈´|b-a
  deltas ← dir⊸×¨↕len+1
  a⊸+¨deltas
}
straight ← >(2≠0⊐˜-´)¨coordpairs
Overlaps ← +´1=⊒

straight_coords ← ∾Line¨ straight / coordpairs
all_coords ← ∾Line¨coordpairs
•Show Overlaps straight_coords
•Show Overlaps all_coords
