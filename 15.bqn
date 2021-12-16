# Thanks to Leah whose solution taught me a lot of nice tricks and
# showed that Bellman-Ford is performant enough and array-y. I had
# tried Dijkstra but this is no lisp and implementing a priority queue
# and whatnot was just too arduous.
# 
# See https://github.com/leahneukirchen/adventofcode2021/blob/master/day15.bqn
# for the most beautiful array solution I've seen to this problem.

in ← ⟨
  "1163751742"
  "1381373672"
  "2136511328"
  "3694931569"
  "7463417111"
  "1319128137"
  "1359912421"
  "3125421639"
  "1293138521"
  "2311944581"
⟩
in ↩ •FLines "15.txt"
grid ← >'0'-˜¨in


# Got this idea from Leah too. Recursion in a 1-modifier feels weird
# but I think I do understand it. There's probably other syntax that
# could work too (eg. the 1-argument versions in BQNcrate).
_FixedPoint ← {𝕩≡𝕨𝔽𝕩 ? 𝕩 ; 𝕨𝕊𝕨𝔽𝕩}

Solve ← {𝕊 grid:
  # initialize ∞ cost except top-left corner (start) is 0
  cost ← 0⌾⊑∞×grid
  
  # The idea of Bellman-Ford: calculate lowest cost from neighbors on
  # every iteration. This is array-y because you can do it for the whole
  # grid at once by shifting the array (filling the border with ∞),
  # adding edge cost and picking minimum throughout.
  infs ← ∞×⊏grid

  # Step is defined inside Solve so infs can be caught in the closure.
  Step ← {grid 𝕊 cost:
    min_neighbor ← (infs«cost) ⌊ (infs»cost) ⌊ (∞«˘cost) ⌊ (∞»˘cost)
    cost ⌊ grid+min_neighbor
  }

  # Run steps until the cost array doesn't change
  solution ← grid Step _FixedPoint cost

  # The answer is the cost to the bottom-right element
  ¯1‿¯1 ⊑ solution
}

•Show Solve grid

fullgrid ← 1+9|1-˜∾(<grid)+5↕↕9
•Show Solve fullgrid

# Runtime was ~50s, ie. almost but not quite forever. But this is much
# much much more readable than the Dijkstra version could have ever
# been.
