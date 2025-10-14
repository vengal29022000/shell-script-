NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)

SUM=$(($NUMBER1+$NUMBER2))

echo "script executing at $TIMESTAMP"

echo "total is:: $SUM"