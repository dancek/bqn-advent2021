in ← •FLines "13.txt"
Split1 ← {(𝕩⊐𝕨)(↑⋈1↓↓)𝕩}
pts‿flds ← (<"") Split1 in
points ← •BQN¨>','Split1¨pts
inf ← 9999 # ∞×0 = NaN so use a near-infinity instead
folds ← ((⊑"yx"⊐11⊸⊑)⌽inf⋈(•BQN 13⊸↓))¨flds

# mirror coordinates by the fold line and deduplicate
Fold ← {xy 𝕊 pts: ⍷{𝕩-(2×𝕩-xy)×𝕩>xy}˘pts}
•Show ≠(⊑folds) Fold points

folded ← points Fold´⌽folds
sx‿sy ← 1+⌈˝folded
grid ← +˝{𝕊 x‿y: (y=↕sy)∧⌜x=↕sx}˘folded
•Out˘grid⊏"░█"

