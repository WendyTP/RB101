## PEDAC on assignment- RPS Bonus Features



### Understand the problem

#### input :

1. user_choice : choices between rock, paper, scissors, lizard, and spock

#### output:

1. **choices_output:** display user and computer's choices
2. **each_game_result:** display if the user or computer wins each round
3. **scoring**: total scoring of user and computer after each round 
4. **final_Score:** display final score and who wins 

#### rule:

1. user choose one of the 5 given choice - rock, paper, scissors, lizard, and spock

2. computer randomly selects one of the 5 given choice

3. compare user & computer's choice, and determine who wins based on the following rules:

scissors cuts paper

paper covers rock

rock crushes lizard

lizard poisons spock

spock smashes scissors

scissors decapitates lizard

lizard eats paper

paper disproves spock

spock vaporizes rock

rock crushes scissors

4. repeats the game until either user or computer reaches five wins



### Example/ Test case

**input:** "ROCK" --> "rock"; "rock" --> "rock"

**Bad input:** no input; any other symbols & words outside of choice

### Data Structure

#### input: 

String 

#### output:

1. **choices_output:**  string
2. **each_game_result:** string
3. **scoring**: integer
4. **final_Score:** integer

#### rule/ requirement

game comparing rule- winning condition: hashes {"paper" => ["rock", "spock"],}

### Algorithm

Greet the user

Explain game rules - 5 wins and game itself

Display each player's beginning score (0 )

Start the game:

Request user input

Validate the input

Computer selects a choice

Start comparing:

set winning conditions

check if user or computer meets the winning conditions

Adding scores to winning player

Display choices result 

Display winning result

Display updated score

Continue the game until one of the player reaches 5 wins

Display the grand winner

= end of game

Ask the user if they want to continue another tournament

Salut



#####

Complete the first programme with simple validation --> modify validation --> simplify the puts message --> extract message to yaml file --> extract logic out of methods 





#### 









