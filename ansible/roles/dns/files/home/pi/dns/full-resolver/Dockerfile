FROM ubuntu:22.04

# 参考
# - [Docker+DNS入門　その2：Unboundを用いたキャッシュDNSサーバ構築 - Qiita](https://qiita.com/miwamoto/items/7981c390ac876a7fac5e)

RUN set -x \
   && apt-get update && apt-get install -y --no-install-recommends \
   unbound \
   curl \
   ca-certificates \
   && apt-get clean \
   && rm -r /var/lib/apt/lists/*

RUN curl -o /etc/unbound/root.hints -LO https://www.internic.net/domain/named.cache
RUN chown -R unbound:unbound /etc/unbound

# unbound-anchor: DNSSEC検証のためのルートトラストアンカーの設置と更新
RUN unbound-anchor -4 -a "/var/lib/unbound/root.key" ; ls -al /var/lib/unbound/root.key

# unbound-checkconf: unboundの設定のエラーを検査
RUN unbound-checkconf; ls -al /var/lib/unbound/root.key










