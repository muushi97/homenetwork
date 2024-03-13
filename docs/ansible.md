# Ansible
## 利用方針

ansible の適用対象は下記を満たしているとして playbook を作成する．

- python3 がインストールされている
- sudo がインストールされている
- sudoers に追加されたユーザへの ssh ログインが可能

## エラーが見にくい
参考: [Ansibleのエラー結果を見やすくする"ANSIBLE\_STDOUT\_CALLBACK=yaml"が良いです - もりはやメモφ(・ω・ )](https://blog.morihaya.tech/entry/2019/01/23/002448)
```shell
export ANSIBLE_STDOUT_CALLBACK=yaml
```


## オプション
### --ask-pass
ssh 接続時のパスワードを入力する．

### --ask-become-pass
sudo 時のパスワードを入力する．

### -t
タグを指定する．

## 構文チェック
```shell
ansible-playbook "${PLAYBOOK}" --syntax-check
```

## 処理対象タスク一覧
```shell
ansible-playbook "${PLAYBOOK}" --list-tasks
```

## 処理対象ホスト一覧
```shell
ansible-playbook "${PLAYBOOK}" --list-hosts
```

## playbook の実行
```shell
ansible-playbook -i "${INVENTORY}" "${PLAYBOOK}" -u "${REMOTE_USER}" -vvv --ask-pass
```

### タグを指定した実行
```shell
ansible-playbook -i "${INVENTORY}" "${PLAYBOOK}" -u "${REMOTE_USER}" -t "${TAG1},${TAG2}" -vvv --ask-pass
```

# 参考文献
- [Ansible.Builtin — Ansible Documentation](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)
- [Community.Docker — Ansible Documentation](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)
- [Ansible の使い方](https://zenn.dev/y_mrok/books/ansible-no-tsukaikata)
- [いまさら Ansible Vault で変数とファイルを暗号化して、Vault パスワードをスクリプトで管理する #Ansible - Qiita](https://qiita.com/3244/items/52911e4c8448ad433eb5)
- [Ansibleのベストプラクティスなディレクトリ構成を試す - tk\_ch’s blog](https://tk-ch.hatenablog.com/entry/20230304/1677858567)
