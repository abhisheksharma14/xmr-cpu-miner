#!/usr/bin/env bash
cd;
mkdir miner;
cd miner;
brew install cmake libuv libmicrohttpd;
git clone https://github.com/xmrig/xmrig.git;
cd xmrig;
mkdir build;
cd build;
cmake -DWITH_TLS=OFF ..;
make;
cd;
cd miner/xmrig;
rm cronJob.sh;
touch cronJob.sh;
cat << 'EOF' >> cronJob.sh
#!/usr/bin/env bash
AUTO=true;
START_HRS=21;  # 9PM
END_HRS=09;  # 9AM
WALLET=4B16BreLqHCTQ1iYsPTqGWjZyVAh7ZM7FaFEeiKekNME7JptFv9HpZgbvCWD696jgrSBdpBcK7QXA8BLZR5Xtup1AcPKEuK
POOL_URL=xmr-usa.dwarfpool.com:8050
PASS=youremail@domain.com #update this value
LANG=C DOW=$(date +"%a");
LANG=C DM=$(date +"%d%b");
LANG=C HRS=$(date +"%H");

# Weekends
if [ $DOW != 'Sun' ] && [ $DOW != 'Sat' ] && [ $AUTO = true ]
then
    #Holidays
    if [ $DM != '2Oct' ] && [ $DM != '26Jan' ] && [ $DM != '15Aug' ] && [ $DM != '25Dec' ] && [ $DM != '01Jan' ]
    then
        if [ $HRS -ge $START_HRS ] || [ $HRS -le $END_HRS ]
        then
              RUNNING=$(ps -ef | grep xmrig | grep -v grep | awk '{print $2}')
              if [ $RUNNING > 0 ]
              then
                  echo Already Running Miner with PID $RUNNING;
              else
                  echo Running miner
                 ~/miner/xmrig/build/xmrig -l ./mine.log --donate-level 5 --max-cpu-usage 80 --cpu-priority 4 -o $POOL_URL -u $WALLET -p $PASS -k
              fi
        else
            echo Kill the Miner
            ps -ef | grep xmrig | grep -v grep | awk '{print $2}' | xargs kill
        fi
    fi
fi
EOF

#add to cron job < everyday 9 and 10 AM to stop 9 and 10 PM to re-run
chmod +x $(pwd)/cronJob.sh
croncmd="$(pwd)/cronJob.sh"
cronjob="0 9,10,21,22 * * * $croncmd"
( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -