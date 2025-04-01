#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate secret number for this session

SECRET_NUMBER=$((RANDOM % (1000 - 1 + 1) + 1))
# echo $SECRET_NUMBER
echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "select user_id from users where name='$USERNAME';")
ATTEMPTS=1

if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_NAME_RESULT=$($PSQL "insert into users(name) values('$USERNAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME';")
else 
  GAMES_COUNT=$($PSQL "select count(*) from games as g left join users as u on g.user_id=u.user_id where g.user_id=$USER_ID;")
  LEAST_NUMBER_OF_GUESSES=$($PSQL "select min(attempts) from games as g left join users as u on g.user_id=u.user_id where g.user_id=$USER_ID;") 
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $LEAST_NUMBER_OF_GUESSES guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read INPUT

while [[ $INPUT -ne $SECRET_NUMBER ]]
do
  if [[ $INPUT =~ ^[0-9]+$  ]]
  then
    if [[ $INPUT -gt $SECRET_NUMBER ]]
    then
      ((ATTEMPTS++))
      echo -e "\nIt's lower than that, guess again:"
      read INPUT
    elif [[ $INPUT -lt $SECRET_NUMBER ]]
    then
      ((ATTEMPTS++))
      echo -e "\nIt's higher than that, guess again:"
      read INPUT
    fi  
  else
    ((ATTEMPTS++))
    echo -e "\nThat is not an integer, guess again:"
    read INPUT
  fi
done


echo -e "\nYou guessed it in "$ATTEMPTS" tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_GAME_DETAILS=$($PSQL "insert into games(user_id, attempts, secret_number) values($USER_ID, $ATTEMPTS, $SECRET_NUMBER)")



