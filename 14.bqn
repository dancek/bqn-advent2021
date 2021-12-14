in ← ⟨
  "NNCB"
  ""
  "CH -> B"
  "HH -> N"
  "CB -> H"
  "NH -> C"
  "HB -> C"
  "HC -> B"
  "HN -> C"
  "NN -> C"
  "BH -> H"
  "NC -> B"
  "NB -> B"
  "BN -> B"
  "BB -> N"
  "BC -> B"
  "CC -> N"
  "CN -> C"
⟩
in ↩ •FLines "14.txt"
Split1 ← {(𝕩⊐𝕨)(↑⋈1↓↓)𝕩}
⟨tmpl⟩‿rulelines ← (<"") Split1 in
rules ← (⥊∘⊢˝⌾(1⊸⊑))¨' 'Split1¨rulelines
nodes ← ∧⊑¨rules
Idx ← ⊑nodes⊐<

rule ← ⊑rules
indices ← ∾´{𝕊 ab‿c:
  ⟨ (Idx ab)‿(Idx (⊑ab)∾c)
    (Idx ab)‿(Idx c∾(1↓ab)) ⟩
}¨rules


mat ← 1¨⌾(indices⊸⊑){𝕩‿𝕩⥊0}≠nodes
init ← +˝⍉nodes≡⌜<˘2↕tmpl

Step ← +˝mat⊸×

unique ← ⍷⊑¨nodes
last ← unique=⊑⌽tmpl
Letters ← {(unique⊐⊑¨nodes)⊔𝕩}

Score ← {
  counts ← last + +´¨Letters Step⍟𝕩 init
  (⌈´counts) - ⌊´counts}

•Show Score 10
•Show Score 40
