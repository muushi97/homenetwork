# Raspberry Pi 4 単体でのルーティング設定

## 概要

Raspberry Pi 4 上に仮想サーバを配置し，これらに Raspberry Pi 4 をルーターとして疎通可能であるように構築する．

## TAP デバイスのリンクと削除

## 事前準備

パッケージリストの更新を行う．

```shell
sudo apt update && sudo apt full-upgrade -y
```

Docker をインストールする．
このインストール作業は下記を参考にした．

- [Install Docker Engine on Raspberry Pi OS (32-bit) | Docker Docs](https://docs.docker.com/engine/install/raspberry-pi-os/#install-using-the-convenience-script)
- [Raspberry Pi 4でDockerのインストール方法 2023年度版 | ラズパイダ](https://raspida.com/rpi4-docker-install)

```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker "$(id -un)"
```

Raspberry Pi 4 上にソフトウェアルーターをインストールする．

```shell
sudo apt install -y frr
```

ソフトウェアルーター上で OSPF を有効化しする．

- [UbuntuでFRRを用いてOSPFをする方法｜Nowhere(望)](https://note.com/2525nowhere/n/n9e14b916bb6c)

```shell
sudo sed -i -e "s/^ospfd=no/ospfd=yes/" /etc/frr/daemons
```

ソフトウェアルーターを再起動し，起動していることを確認する．

```shell
sudo systemctl restart frr
sudo systemctl list-units | grep frr
```

Raspberry Pi 4 においてパケットの転送を許可する．
まず現在の状態を確認する．

```shell
sudo iptables -nvL --line-numbers
```

全てのパケットの転送を許可するように設定を行う．
ここで `-I` オプションを `-R` とすることで置換を行う．

```shell
sudo iptables -I FORWARD 1 -j ACCEPT
```

## Windows 上のスタティックルート設定

Windows 上で Raspberry Pi 4 を経由して通信を行うようにスタティックルートを設定する．
これは一時的な設定である．

```
route add 10.145.4.0 mask 255.255.255.0 192.168.157.27 metric 1
```

## SoftEther の起動

SoftEther を起動し，起動していることを確認する．

```shell
sudo systemctl restart vpnserver
sudo systemctl list-units | grep vpnserver
```





