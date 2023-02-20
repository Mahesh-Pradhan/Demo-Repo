find_avg(){
n_arg=$2
sum=$1

echo "sum is " $sum
avg=$((sum/n_arg))
echo $avg
}

sum(){
n_arg=$#
echo $n_arg
um=0
x=0
for x in "$@"
do
x=x+1
 um=$((um + x))
done
return $um $x
} 







sum 30 40 50 60 70 80
find_avg $um $x 
