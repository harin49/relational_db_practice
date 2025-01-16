#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate table teams, games RESTART IDENTITY")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    TEAMW_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'")
    echo $TEAMW_ID
    if [[ -z $TEAMW_ID ]]
    then
      INSERT_TEAMW_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $INSERT_TEAMW_RESULT == "INSERT 0 1" ]]
      then
        echo "inserted new team into table"
        TEAMW_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'")
      fi 
    fi

    TEAMO_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'")
    if [[ -z $TEAMO_ID ]]
    then
      INSERT_TEAMO_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $INSERT_TEAMO_RESULT == "INSERT 0 1" ]]
      then
        echo "inserted new team into table"
        TEAMO_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'")
      fi 
    fi

    echo $TEAMW_ID $TEAMO_ID
    INSERT_GAMES_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$YEAR', '$ROUND', '$TEAMW_ID', '$TEAMO_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
     if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
      then
        echo "inserted new record into games"
      fi  
  fi
done
