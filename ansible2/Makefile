

all: secrets/id_ed25519 ./bin/dhall-to-yaml-ng


secrets/id_ed25519:
	mkdir -p secrets
	chmod 700 secrets
	ssh-keygen -t ed25519 -N "" -f ./secrets/id_ed25519


# [Getting started: Generate JSON or YAML — Dhall documentation](https://docs.dhall-lang.org/tutorials/Getting-started_Generate-JSON-or-YAML.html#linux)
./bin/dhall-to-yaml-ng: ./.tmp/dhall-yaml.tar.bz2
	mkdir -p ./.tmp/dhall-yaml
	tar --extract --file ./.tmp/dhall-yaml.tar.bz2 -C ./.tmp/dhall-yaml
	mkdir -p ./bin
	cp -r ./.tmp/dhall-yaml/bin/* ./bin
./.tmp/dhall-yaml.tar.bz2:
	mkdir -p ./.tmp
	curl -L https://github.com/dhall-lang/dhall-haskell/releases/download/1.42.0/dhall-yaml-1.2.12-x86_64-linux.tar.bz2 > ./.tmp/dhall-yaml.tar.bz2

