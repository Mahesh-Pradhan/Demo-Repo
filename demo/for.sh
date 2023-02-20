name(){
x=$1
while [ $X > 0 ]
do
  echo "_pradhan"
  x='expr $x - 1'
done
}
x=3
name() $x
