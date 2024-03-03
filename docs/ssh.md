# SSH
## 鍵
```shell
ssh-keygen -t ed25519 -N "" -f id_ed25519
```
```shell
ssh-copy-id -i id_ed25519 ${USER}@${IP_ADDRESS}
```

