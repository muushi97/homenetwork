# Ansible

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


