# homenetwork
## 学習記録
- [Namespace](./docs/namespace.md)
    - `ip tap` コマンド
- [Ansible](./docs/ansible.md)
- [SSH](./docs/ssh.md)
- [Docker](./docs/docker.md)
- [Linux Networking](./docs/linux-networking.md)
- [Nginx](./docs/nginx.md)
    - リバースプロキシサーバ
    - HTTP サーバ
- [Kea](./docs/kea.md)
    - DHCP サーバ
- [NSD](./docs/nsd.md)
    - 権威 DNS サーバ
- [Unbound](./docs/unbound.md)
    - キャッシュ DNS サーバ
- [JupyterLab](./docs/jupyterlab.md)



## ネットワーク設計

### 機器

| 機器 | ホスト名 | IP | 役割 |
| --- | --- | --- | --- |
| WRC-175GS | - | - | ルーター |
| Raspberry PI 4 | pi4 | 192.168.157.27/24 | 仮想サーバのホスト兼ソフトウェアルーター |
| Raspberry PI 3 | pi3 | 192.168.157.28/24 | 仮想サーバのホスト兼ソフトウェアルーター |


### IP アドレス
#### 物理ネットワーク

物理機器が接続するネットワークの IP アドレス `192.168.157.0/24` の範囲とする．


#### 仮想ネットワーク 1

仮想サーバ群が接続するネットワークの IP アドレスは `10.0.0.0/16` の範囲とする．
このネットワークは他の任意の仮想ネットワークと疎通するものとする．


#### 仮想ネットワーク 2

仮想サーバ群が接続するネットワークの IP アドレスは `10.100.0.0/16` の範囲とする．
このネットワークは仮想ネットワーク1とのみ疎通するものとする．


#### 仮想ネットワーク 3

仮想サーバ群が接続するネットワークの IP アドレスは `10.200.0.0/16` の範囲とする．
このネットワークは仮想ネットワーク1とのみ疎通するものとする．







