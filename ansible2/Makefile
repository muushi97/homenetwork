

ROLEDIR := roles


FILES_DHALLS := $(shell find $(ROLEDIR)/ -type f -name '*.dhall' | grep -E '/files/')
FILES_YMLS := $(patsubst %.dhall,%.yml,$(FILES_DHALLS))

TEMPLATES_DHALLS := $(shell find $(ROLEDIR)/ -type f -name '*.dhall.j2' | grep -E '/templates/')
TEMPLATES_YMLS := $(patsubst %.dhall.j2,%.yml.j2,$(TEMPLATES_DHALLS))

YMLS := $(FILES_YMLS) $(TEMPLATES_YMLS)


all: secrets/id_ed25519 ./bin/dhall-to-yaml-ng $(YMLS) roles/prometheus/files/opt/prometheus-2.45.3.linux-amd64.tar.gz

galaxy:
	ansible-galaxy collection install community.docker

# [Download | Prometheus](https://prometheus.io/download/)
roles/prometheus/files/opt/prometheus-2.45.3.linux-amd64.tar.gz:
	curl -L https://github.com/prometheus/prometheus/releases/download/v2.45.3/prometheus-2.45.3.linux-amd64.tar.gz -o $@


secrets/id_ed25519:
	mkdir -p secrets
	chmod 700 secrets
	ssh-keygen -t ed25519 -N "" -f ./secrets/id_ed25519

%.yml: %.dhall ./bin/dhall-to-yaml-ng
	./bin/dhall-to-yaml-ng --file $< --output $@

%.yml.j2: %.dhall.j2 ./bin/dhall-to-yaml-ng
	./bin/dhall-to-yaml-ng --file $< --output $@

# [Getting started: Generate JSON or YAML — Dhall documentation](https://docs.dhall-lang.org/tutorials/Getting-started_Generate-JSON-or-YAML.html#linux)
./bin/dhall-to-yaml-ng: ./.tmp/dhall-yaml.tar.bz2
	mkdir -p ./.tmp/dhall-yaml
	tar --extract --file ./.tmp/dhall-yaml.tar.bz2 -C ./.tmp/dhall-yaml
	mkdir -p ./bin
	cp -r ./.tmp/dhall-yaml/bin/* ./bin
./.tmp/dhall-yaml.tar.bz2:
	mkdir -p ./.tmp
	curl -L https://github.com/dhall-lang/dhall-haskell/releases/download/1.42.0/dhall-yaml-1.2.12-x86_64-linux.tar.bz2 > ./.tmp/dhall-yaml.tar.bz2

