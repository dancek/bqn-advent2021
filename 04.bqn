While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´
Split ← ((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)
ReadSeparated ← •BQN¨Split

chars ← •FChars "04.txt"
lines ← (@+10) Split chars

nums ← ',' ReadSeparated 0⊑lines
rows ← > ' ' ReadSeparated¨ 1↓lines
boards ← ∘‿5‿5 ⥊ rows
marks ← 0×boards

# Check for bingo by multiplying every number in a row/column
# (it's 1 only if all values are 1). Sum these for every row
# and column. Convert all nonzero values to 1.
IsBingo ← 0≠ (+´ (×˝⍉) ∾ ×˝)

n ← 0
len ← ≠boards
bingoIdx ← len
While {𝕤 ⋄ bingoIdx = len}‿{𝕤
  n ↩ ⊑nums
  nums ↩ 1↓nums
  hits ← boards = n
  marks ↩ marks + hits
  bingoIdx ↩ ⊑(IsBingo˘marks)⊐1
}

unmarked ← (1-bingoIdx⊏marks)×bingoIdx⊏boards
•Show n × +´+˝unmarked

# Just copypaste and spaghetti with idx to know what was last.
# This could be much better but the answer is easy to get so I
# won't bother right now.
bingos ← IsBingo˘marks
idx ← len
While {𝕤 ⋄ (+´bingos) < len}‿{𝕤
  idx ↩ ⊑bingos⊐0
  n ↩ ⊑nums
  nums ↩ 1↓nums
  hits ← boards = n
  marks ↩ marks + hits
  bingos ↩ IsBingo˘marks
}

unmarked ↩ (1-idx⊏marks)×idx⊏boards
•Show n × +´+˝unmarked
