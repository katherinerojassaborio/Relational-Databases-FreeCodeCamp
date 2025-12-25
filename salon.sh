#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWelcome to the salon\n"
MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo -e "\nPick a service\n"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done



echo -e "\nWhich one would you like to get?"
read SERVICE_ID_SELECTED

# if input is not a number
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
     MAIN_MENU "Please enter a valid option."
  else 
  #if the service doesn't exist
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID ]]
    then
    MAIN_MENU "The service doesn't exist. Choose one from the list"
    else 
    
    # get phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
        then
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          #Insert data into costumers
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      # get customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # choose service time
      echo -e "\nEnter the time of your appointment"
      read SERVICE_TIME
      
      # insert appointment
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")
      SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
      CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
  fi
fi

}
MAIN_MENU