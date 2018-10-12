# xmr-cpu-miner
A small script to setup a CPU miner for Monero (XMR) with features like crontab and minimal monitoring.

# Features!

  - Using Xmrig tool with cryptonight algorithm by default
  - Configure Crontab according to your requirements
  - Dwarfpool integrated by default
  - Time management
  - The mining will stop automatically during your working hours (Default 10 AM to 10 PM)
  - Weekends handled already (Mining will be continued the whole weekend when you are not using the CPU much)
  - Highly Customizable
  - You can add public holidays so that the miinig continues unattended.
  - Don't worry about multiple processes of miner running at the same time


#### You can also:
  - Manage the scheduler according to your requirement. In short, you can change the mining hours as per your needs
  - Use your custom pool url.
  - Can turn on/off automatic mining funtionality with just one flag.


#### Tech
* [Xmrig](https://github.com/xmrig/xmrig) - XMRig is a high performance Monero (XMR) CPU miner


### Installation
Update the script with your details before running.
Update your wallet address and corresponding details
(Optional) Update the Crontab related timings and constant according to your requirements 

```sh
$ https://github.com/abhisheksharma14/xmr-cpu-miner.git
$ cd xmr-cpu-miner
$ #update the script according to your needs
$ sudo sh miner_linux.sh # for linux
$ sh miner_mac.sh # for macOS
```

### Todos

 - Adding support for arguments
 - Managing logs for the jobs and miners
 - Adding alerts

### Donate
Monero Wallet Address : `4B16BreLqHCTQ1iYsPTqGWjZyVAh7ZM7FaFEeiKekNME7JptFv9HpZgbvCWD696jgrSBdpBcK7QXA8BLZR5Xtup1AcPKEuK`

OR

Scan QR code

![](https://raw.githubusercontent.com/abhisheksharma14/xmr-cpu-miner/master/mymonero.png)

License
----
MIT

**Free Script, Hell Yeah!**
