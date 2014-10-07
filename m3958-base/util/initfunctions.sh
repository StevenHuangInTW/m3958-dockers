
create_skeleton () {
  local pn=$1
  local rdr="/opt/runningapp/$pn"
  local ssconf="${rdr}/supervisor.d/supervisord.conf"
  local data="${rdr}/data"
  local log="${rdr}/log"
  local cfg="${rdr}/cfg"
  local runner=$2
  local cfgfstr=$3
  local cfgfiles=()
  
  if [ ! -e "$rdr" ]; then
    mkdir $rdr
  fi

  if [ ! -e "${rdr}/supervisor.d" ]; then
    cp -R /cfgdir/supervisor.d $rdr
  fi
  
  if [ -z $(cat ${ssconf}|grep "program:${pn}") ]; then
    echo "[program:${pn}]" >> $ssconf
    echo "command=${runner}" >> $ssconf
  fi
  
  echo "/usr/bin/supervisord -c ${ssconf}" >> /run_container.sh
  
  if [ ! -e "$data" ]; then
    mkdir -p "$data"
  fi
  
  if [ ! -e "$log" ]; then
    mkdir -p "$log"
  fi
  
  if [ ! -e "$cfg" ]; then
    mkdir -p "$cfg"
  fi

  if [ ! -z "$cfgfstr" ]; then
    cfgfiles=(${cfgfstr//;/ }) 
    for cf in "${cfgfiles[@]}"; do
      cp $cf $cfg
    done
  fi
}
