# homenetwork
## 参考文献
### Docker
- [Docker Docs](https://docs.docker.com/)
- [Raspberry Piでlinux/amd64のDockerコンテナーを動かす | Takeshi Yonezu](https://tkyonezu.com/iot/raspberry-pi%E3%81%A7linux-amd64%E3%81%AEdocker%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A%E3%83%BC%E3%82%92%E5%8B%95%E3%81%8B%E3%81%99/)

### Ansible
- [Ansible.Builtin — Ansible Documentation](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)
- [Community.Docker — Ansible Documentation](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)
- [Ansible の使い方](https://zenn.dev/y_mrok/books/ansible-no-tsukaikata)
- [Ansible チートシート](./ansible.md)

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







