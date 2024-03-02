# Linux Networking

## 固定 ip address の設定
最低限 `address` が指定されていれば良く，必要ならばデフォルトゲートウェイを `gateway` によって設定することができる．

```
auto eth0
iface eth0 inet static
    address 192.168.0.0/24
    gateway 192.168.0.254
```

## 参考
- [NetworkConfiguration - Debian Wiki](https://wiki.debian.org/NetworkConfiguration)
