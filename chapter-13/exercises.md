1. Define a parser `comment :: Parser ()` for ordinary Haskell comments that begins with the symbol `--` and extend to the end of the current line, which is represented by the control character `'\n'`.

  * ```haskell
    -- Answer goes here
    ```
    

2. Using our second grammar for arithmetic expressions, draw the two possible parse trees for the expression `2+3+4`.

  * ```haskell
    -- Answer goes here
    ```

3. Using our third grammar for arithmetic expressions, draw the parse trees for the expressions `2+3`, `2*3*4` and `(2+3)+4`.

  * ```haskell
    -- Answer goes here
    ```

4. Explain why the final simplification of the grammar for arithmetic expressions has a dramatic effect on the efficiency of the resulting parser. Hint: begin by considering how an expression comprising a single number would be parsed if this simplification step had not been made.

  * ```haskell
    -- Answer goes here
    ```
5. Define a suitable type `Expr` for arithmetic expression and modify the parser for expression to have type `expr :: Parser Expr`.

  * ```haskell
    -- Answer goes here
    ```

6. Extend the parser `expr :: Parser Int` to support subtraction and division, and to use integer values rather than natural numbers, based upon the following revisions to the grammar:

    > expr ::= term ( `+` expr | `-` expr | ε )

    > term ::= factor ( `*` term | `/` term | ε )

    > factor ::= `(` expr `)` | int

    > int ::= ... | `-1` | `0` | `1` | ...

  * ```haskell
    -- Answer goes here
    ```

7. Further extend the grammar and parser for arithmetic expression to support exponentiation `^`, which is assumed to associate to the right and have higher priority than multiplication and division, but lower priority than parenthesis and numbers. For example, `2^3*4` means `(2^3)*4`. Hint: the new level of priority requires a new rule in the grammar.
  
  * ```haskell
    -- Answer goes here
    ```

8. Consider expression build up from natural numbers using a subtraction operator that is assumed to associate to the left.

    a. Translate this description into a grammar.

    a. Implement this grammar as a parser `expr :: Parser Int`

    a. What is the problem with this parser?

    a. Show how it can be fixed. Hint: rewrite the parser using the repetition primitive `many` and the library function `foldl`.

  * ```haskell
    -- Answer goes here
    ```

9. Modify the calculator program to indicate the approximate position of an error rather than just sounding a beep, by using the fact that the parser returns the unconsumed part of the input string.

  * ```haskell
    -- Answer goes here
    ```
