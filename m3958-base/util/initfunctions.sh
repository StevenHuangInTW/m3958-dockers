
# pn, runner, ;sep cfgfstr, user
create_skeleton () {
  local pn=$1
  local runner=$2
  local cfgfstr=$3
  local usr=$4
  local rdr="/opt/runningdir/$pn"
  local ssconf="${rdr}/supervisor.d/supervisord.conf"
  local data="${rdr}/data"
  local log="${rdr}/log"
  local cfg="${rdr}/cfg"
  local cfgfiles=()

  local flagf=/.${pn}.initialized
  if [ -f "$flagf" ]; then
    return 0
  fi
  
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
    if [ -n "$usr" ]; then
      chown -R $data
    fi
  fi
  
  if [ ! -e "$log" ]; then
    mkdir -p "$log"
    if [ -n "$usr" ]; then
      chown -R $log
    fi
  fi
  
  if [ ! -e "$cfg" ]; then
    mkdir -p "$cfg"
  fi

  if [ ! -z "$cfgfstr" ]; then
    cfgfiles=(${cfgfstr//;/ }) 
    for cf in "${cfgfiles[@]}"; do
      cp -f $cf $cfg
    done
  fi

  touch ${flagf}
}
