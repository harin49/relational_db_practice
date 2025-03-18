#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


LIST_SERVICES() {
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name from services");
  echo "$AVAILABLE_SERVICES" | while read service_id bar name
  do
    echo "$service_id) $name"
  done 
}

echo -e "\n ~~~~ Salon appointment scheduler ~~~~ \n";

LIST_SERVICES

echo -e "\nEnter your appointment details\n"
echo -e "Enter the service you'd like to book\n"
read SERVICE_ID_SELECTED

SELECTED_SERVICE_NAME=$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED'")

if [[ -z $SELECTED_SERVICE_NAME ]]
then
  echo -e "\nInvalid service selected, try again from the list\n"
  LIST_SERVICES
fi

echo -e "\nEnter your phone number\n"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nGiven phone number not in records, enter name to register"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT="$($PSQL "insert into customers (phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")"
fi


echo -e "\nEnter your time slot\n"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'");

INSERT_APPOINTMENT_RESULT="$($PSQL "insert into appointments (service_id, customer_id, time) values('$SERVICE_ID_SELECTED', '$CUSTOMER_ID', '$SERVICE_TIME')")"


if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
then
  echo -e "\nI have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi