#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Validate if there is an argument when you run the script
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else 
# Validate the provided argument
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    CONDITION="atomic_number = $1"
  else
    CONDITION="symbol = '$1' OR name = '$1'"
  fi

  # Get data from the tables
  ELEMENT_INFORMATION=$($PSQL "SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE $CONDITION")
  # Validate the existence of the element
  if [[ -z $ELEMENT_INFORMATION ]]
  then 
    echo "I could not find that element in the database."
  else
    # Get the information from the tables
    echo "$ELEMENT_INFORMATION" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi
