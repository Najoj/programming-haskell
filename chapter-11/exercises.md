1. Using the function `gametree`, verify that there are 549,946 nodes in the complete game tree for a 3 × 3 tic-tac-toe game starting from the empty grid, and that the maximum depth of this tree is 9.

  * ```haskell
    count_nodes :: Tree a -> Int
    count_nodes (Node _ t) = 1 + sum (map count_nodes t)

    get_depth :: Tree a -> Int
    get_depth (Node _ []) = 0
    get_depth (Node _ t ) = 1 + maximum (map get_depth t)
    ```
    
    Run:

    ```
    *Main> count_nodes (gametree empty O)
    549946
    *Main> get_depth (gametree empty O)
    9
    ```

2. Our tic-tac-toe program always chooses the first move from the list of best moves. Modify the final program to choose a random move from the list of best moves using the function `randomRIO :: (Int,Int) -> IO Int` from `System.Random` to generate a random integer in the given range.

  * ```haskell
    -- Answer goes here
    ```

3. Alternatively, modify the final program to choose a move that attempts to take the quickest route to a win, by calculating the depths of resulting game trees and selecting a move that results in a tree with teh smallest depth.

  * ```haskell
    -- Answer goes here
    ```

4. Modify the final program to:

    a. let the user decide if they wish to play first or second;

    b. allow the length of a winning line to also be changed;

    c. generate the game tree once, rather than for each move;

    d. reduce the size of game tree using alpha-beta pruning.

  * ```haskell
    -- Answer goes here
    ```

