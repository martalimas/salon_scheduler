#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo "Welcome to My Salon, how can I help you?"
# mostrar lista
echo "$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")" | while IFS="|" read ID NAME
do
  echo "$ID) $NAME"
done

# ler input
read SERVICE_ID_SELECTED
SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")


# enquanto o serviço não for válido pede para tentar de novo e mostra as hipoteses
until [[ -n $SERVICE ]] 
do
  echo "$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")" | while IFS="|" read ID NAME
  do
    echo "$ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE ]]
  then
    echo "I could not find that service. What would you like today?"
  fi
done

#pedir telefone 
echo "What's your phone number?"
read CUSTOMER_PHONE

#verificar se o cliente existe
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

#se não existir
if [[ -z $CUSTOMER_NAME ]]
then
echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
fi

# pedir hora
echo "What time would you like your $SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME

# buscar customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# inserir agendamento
$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

# output final
$PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')" > /dev/null

$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" > /dev/null

echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."