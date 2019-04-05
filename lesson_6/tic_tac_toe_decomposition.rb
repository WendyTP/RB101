# Basic Tic Tac Toe game decompose
=begin
# Understand the problem:
Tic Tac Toe is a 2 player game played on a 3x3 board. 
Each player takes a turn and marks a square on the board. 
First player to reach 3 squares in a row, including diagonals, wins. 
If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

# High level pseudo-code:
1. Display the initial empty 3 x 3 game baord.  (Sub-process)
2. Ask the user to mark a square  (Sub-process)   -> select a number (1-9) , fill the square with O
3. The computer marks a square    (Sub-process)
4. Display the updated game board state.      (Sub-process)
5. If there's a winner, display the winner.
6. Elsif the board is full, display tie.
7. Else (neither winner nor full board), back to step # 2
8. Ask the user for playing again?
9. If yes, back to step #1
10. If not, goodbye


# Sub-process:
# Display board
line1= "|1|2|3|"
line2= "|4|5|6|"
horizontal = " - - -"
  
=end