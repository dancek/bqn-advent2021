While ← {𝕨{𝕊∘𝔾⍟𝔽𝕩}𝕩@}´
in ← ⟨
  "[({(<(())[]>[[{[]{<()<>>"
  "[(()[<>])]({[<{<<[]>>("
  "{([(<{}[<>[]}>{[]{[(<()>"
  "(((({<>}<{<{<>}{[]{[]{}"
  "[[<[([]))<([[{}[[()]]]"
  "[{[{({}]{}}([{[{{{}}([]"
  "{<[[]]>}<{[{[{[]{()[[[]"
  "[<(<(<(<{}))><([]([]()"
  "<{([([[(<>()){}]>(<<{{"
  "<{([{{}}[<[[[<>{}]]]>[]]"
⟩
in ↩ •FLines "10.txt"

Score ← {(⊑")]}>"⊐𝕩) ⊑ 3‿57‿1197‿25137‿0}

# iterate the string, keeping stack of parens
# return stack and error score
Parse ← {𝕊 line:
  stack ← ""
  error ← 0
  While {𝕤 ⋄ 0≠≠line}‿{𝕤
    c ← ⊑line
    line ↩ 1↓line
    {⊑c∊"([{<"
      ? stack ↩ c∾stack
      ; p ← ⊑stack
        stack ↩ 1↓stack
        # check for correctness by seeing if ascii distance of
        # parens is 1 or 2
        {2<|c-p ? error ↩ c ⋄ line ↩ ""; 0}
    }
  }
  stack ⋈ Score error
}

stacks_scores ← >Parse¨in
•Show +´1⊏˘stacks_scores

# incomplete inputs are those without errors
incomplete ← 0⊏˘{(0=1⊏˘𝕩)/𝕩}stacks_scores

CompletionScore ← {+´(" ([{<"⊸⊐˘𝕩) × ⌽5⋆↕≠𝕩}

# sort completion scores and print the middle one
•Show (⌊0.5×≠incomplete)⊑∧CompletionScore¨incomplete
