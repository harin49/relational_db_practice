#! /bin/bash
PSQL="psql --username=postgres --dbname=periodic_table -t --no-align -c"

NOT_FOUND() {
echo -e "I could not find that element in the database."
}

FOUND() {
  echo -e "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
}

# if input is empty

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
fi

# check if input is symbol, atomic number or name

# if input is atomic number, check if in db. if yes print, if no print error

if [[ $1 =~ ^[0-9]+$ ]]
then
  RESULT=$($PSQL "select p.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type from properties as p left join elements as e on
        p.atomic_number = e.atomic_number left join types as t on p.type_id=t.type_id where p.atomic_number=$1")
  if [[ -z $RESULT ]]
  then 
    NOT_FOUND
  else
    echo "$RESULT" | while IFS='|' read -r  ATOMIC_NUMBER  ATOMIC_MASS  MELTING_POINT  BOILING_POINT  SYMBOL  NAME  TYPE; do  
      FOUND $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
    done    
  fi
  exit 0
fi

# if input is symbol, get atomic_number, check if in db. if yes print, if no print error
if [[ -n "$1" && ${#1} -lt 3  ]]
then
  RESULT=$($PSQL "select p.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type from properties as p left join elements as e on
        p.atomic_number = e.atomic_number left join types as t on p.type_id=t.type_id where symbol='$1'")
  if [[ -z $RESULT ]]
  then 
    NOT_FOUND
  else
    echo "$RESULT" | while IFS='|' read -r  ATOMIC_NUMBER  ATOMIC_MASS  MELTING_POINT  BOILING_POINT  SYMBOL  NAME  TYPE; do  
      FOUND $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
    done    
  fi
  exit 0
fi

# if input is name, get atomic_number, check if in db. if yes print, if no print error

if [[ -n "$1" && ${#1} -gt 2  ]]
then
  RESULT=$($PSQL "select p.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type from properties as p left join elements as e on
        p.atomic_number = e.atomic_number left join types as t on p.type_id=t.type_id where name='$1'")
  if [[ -z $RESULT ]]
  then 
    NOT_FOUND
  else
    echo "$RESULT" | while IFS='|' read -r  ATOMIC_NUMBER  ATOMIC_MASS  MELTING_POINT  BOILING_POINT  SYMBOL  NAME  TYPE; do  
      FOUND $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
    done    
  fi
  exit 0
fi

