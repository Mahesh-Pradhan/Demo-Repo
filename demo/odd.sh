odd(){
x=$1
if [ $((x%2)) == 0 ]; then
echo "Invalid"
else
echo "its odd"
fi
}
read a
odd $a
