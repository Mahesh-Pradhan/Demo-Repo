fun(){
x=$1
if [ $((x%2) == 0 ) ]; then
echo "$x is not odd"
else
echo "$x is odd"
fi
}
read a
fun $a

