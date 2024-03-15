

# [Build VyOS — VyOS 1.3.x (equuleus) documentation](https://docs.vyos.io/en/equuleus/contributing/build-vyos.html)
# [VyOS 1.3 LTS ISOイメージ作成手順 - インフラエンジニアのメモ帳](https://server-network-note.net/2021/12/vyos-1-3-lts-iso-make/)

EMAIL = "moouushi@gmail.com"


all: iso/vyos-1.3.6-amd64.iso


vyos-1.2.6:
	[ -e vyos-build-crux     ] || git clone -b crux     --single-branch https://github.com/vyos/vyos-build vyos-build-crux
	docker run --rm -it --privileged -v ${PWD}/vyos-build-crux:/vyos     -w /vyos -e GOSU_UID=$(id -u) -e GOSU_GID=$(id -g) vyos/vyos-build:crux     bash -c "./configure --architecture amd64 --build-type release --version 1.2.6 --build-by \"${EMAIL}\" && sudo make iso"

iso/vyos-1.3.6-amd64.iso: vyos-build-equuleus/build/vyos-1.3.6-amd64.iso
	mkdir -p iso
	cp vyos-build-equuleus/build/vyos-1.3.6-amd64.iso iso/vyos-1.3.6-amd64.iso

vyos-build-equuleus/build/vyos-1.3.6-amd64.iso:
	[ -e vyos-build-equuleus ] || git clone -b equuleus --single-branch https://github.com/vyos/vyos-build vyos-build-equuleus
	docker run --rm -it --privileged -v ${PWD}/vyos-build-equuleus:/vyos -w /vyos -e GOSU_UID=$(id -u) -e GOSU_GID=$(id -g) vyos/vyos-build:equuleus bash -c "./configure --architecture amd64 --build-type release --version 1.3.6 --build-by \"${EMAIL}\" && sudo make iso"


