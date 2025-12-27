#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# validate username
while true
do
  echo "Enter your username:"
  read USERNAME_INPUT
  # validate length of input
  if [[ ${#USERNAME_INPUT} -gt 22 ]]
  then
    echo "Username is too long. Make sure it is shorter than 22 characters."
  else
    break 
  fi
done


# get user information
USER_INFORMATION=$($PSQL "SELECT user_id, COUNT(game_id), MIN(guesses) FROM users LEFT JOIN games USING(user_id) WHERE username='$USERNAME_INPUT' GROUP BY user_id")
if [[ -z $USER_INFORMATION ]]
then
  echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
  INSERT_USER_RESULT="$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME_INPUT')")"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME_INPUT'")
else
  echo "$USER_INFORMATION" | while IFS="|" read USER_ID GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME_INPUT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
  USER_ID=$(echo "$USER_INFORMATION" | cut -d'|' -f1)
 fi       
    
sleep 1
# start the counter of guesses
TRIES=0
echo "Guess the secret number between 1 and 1000:"
while true 
  do 
    read GUESS
    ((TRIES++))
    # verifiy that the input is a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    # if the number is correct, then we save it into the games table
    elif [[ $GUESS -eq $SECRET_NUMBER ]]
    then
      echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $TRIES)")
      break
    # if the input is lower or higher, we print the messages
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else 
      echo "It's higher than that, guess again:"
    fi
  done


   
