## About:

[Docker](http://www.docker.com/) image based on [digitalwonderland/base](https://registry.hub.docker.com/u/digitalwonderland/base/)

## Additional Software:

* [Bitcoin Core](https://bitcoin.org)

## Usage:

```bitcoind```, ```bitcoin-cli``` & ```test_bitcoin``` are installed into ```/usr/local/bin```.

```ENTRYPOINT``` is set to ```/usr/local/bin/bitcoind``` so you can just do something like

```
$ docker run --name bitcoind --publish 8332:8332 --publish 8333:8333 -v /volumes/bitcoind:/var/lib/bitcoind digitalwonderland/bitcoind -server -disablewallet -rpcuser=$USER -rpcpassword=$PASSWORD -rpcallowip=$IP
```
