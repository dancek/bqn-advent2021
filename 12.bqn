in ← •FLines "12.txt"
edges ← '-'{(𝕩⊐𝕨)(↑⋈1↓↓)𝕩}¨in
nodes ← ⍷∨∾edges
len ← ≠nodes
Idx ← ⊑nodes⊐<

# upper-case nodes are revisitable
revisitable ← 'Z'≥⊑¨nodes

# create adjacency matrix
adj ← (⋈˜len)⥊0
{𝕊 a‿b:
  adj ↩  adj + ⍉⊸+((Idx a)=↕len)∧⌜(Idx b)=↕len
}¨edges

# sum with recursive DFS
PathCount ← {visited‿revisit 𝕊 node:
  node ≠ Idx "end" ?
    ns ← / (¬visited) ∧ node⊏adj
    rs ← / (¬"start"⊸≡¨nodes) ∧ revisit ∧ visited ∧ node⊏adj
    v ← { node⊑revisitable ? visited ; visited ∨ node=↕len }
    +´ ((v‿0)⊸PathCount¨rs) ∾ (v‿revisit)⊸PathCount¨ns
  ; 1
}

•Show (len⥊0)‿0 PathCount (Idx "start")
•Show (len⥊0)‿1 PathCount (Idx "start")
