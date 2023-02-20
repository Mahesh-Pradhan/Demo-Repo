fun1(){
echo "hello my name is $1"
echo "do i know you"
}

fun1 mahesh

fun2(){
echo $1
echo $2
echo $#
echo $@
}
fun2 mahesh kumar


