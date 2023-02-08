configFile=./conf.ini

inds=($(awk '/\[.*\]/ {print NR}' $configFile))

lastInd=$((${#inds[*]} - 1))

readKey() {
  local section=$1
  local key=$2
  local readResult
  local nr=$(awk '/\['$section'\]/ {print NR}' $configFile)
  if [ -z $nr ]; then
    return
  fi
  if [ $nr -eq ${inds[$lastInd]} ]; then
    readResult=$(awk -F= '/'$key'/ && NR>'$nr' {print $2; exit }' $configFile)
  else
    local aln=${#inds[*]}
    local enInd
    for ((i = 0; i < $aln; i++)); do
      if [ ${inds[$i]} -eq $nr ]; then
        enInd=${inds[$i + 1]}
      fi
    done
    readResult=$(awk -F= '/'$key'/ && NR>'$nr' && NR<'$enInd' {print $2; exit }' $configFile)
  fi
  echo $readResult
}

# 去除结尾\r
trim(){
  text=`echo $1 | tr -d "\r"`
  echo $text
}

serverPort=$(readKey "server" "port")
mysqlDb=$(readKey "mysql" "db")
mysqlPort=$(readKey "mysql" "port")
mysqlUser=$(readKey "mysql" "user")
mysqlPass=$(readKey "mysql" "pass")
mysqlIp=$(readKey "mysql" "ip")

mysqlDsn="$mysqlUser:$mysqlPass@tcp($mysqlIp:$mysqlPort)/$mysqlDb"

echo $serverPort
echo $(trim $mysqlDsn)
