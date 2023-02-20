host=$(hostname)
currentdate=$(date)
ipaddd=$(hostname -I | cut -d ' ' -f1)

echo " Today is $currendate"

echo  "Hostname : $host (ipadd):"
echo $ipadd
