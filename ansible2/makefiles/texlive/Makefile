
IMAGENAME := "texlive:latest"

all: texlive2020.tar.gz

ls:
	docker run -it --rm texlive:2020 ls -l /tmp/install-tl-unx
	docker run -it --rm -u $(id -u):$(id -g) texlive:2020 id

texlive2020.tar.gz: Dockerfile
	docker build \
		--build-arg TEXLIVE_VERSION=2020 \
		--build-arg TEXDIR="/opt/texlive" \
		--target texlive-base . -t texlive:2020
	docker run --rm texlive:2020 tar -zvcf - -C /opt texlive > texlive2020.tar.gz

texlive2021.tar.gz: Dockerfile
	docker build \
		--build-arg TEXLIVE_VERSION=2021 \
		--build-arg TEXDIR="/opt/texlive" \
		--target texlive-base . -t texlive:2021
	docker run --rm texlive:2021 tar -zvcf - -C /opt texlive > texlive2021.tar.gz

texlive2022.tar.gz: Dockerfile
	docker build \
		--build-arg TEXLIVE_VERSION=2022 \
		--build-arg TEXDIR="/opt/texlive" \
		--target texlive-base . -t texlive:2022
	docker run --rm texlive:2022 tar -zvcf - -C /opt texlive > texlive2022.tar.gz

texlive2023.tar.gz: Dockerfile
	docker build \
		--build-arg TEXLIVE_VERSION=2023 \
		--build-arg TEXDIR="/opt/texlive" \
		--target texlive-base . -t texlive:2023
	docker run --rm texlive:2023 tar -zvcf - -C /opt texlive > texlive2023.tar.gz

clean:
	rm texlive2020.tar.gz
	rm texlive2021.tar.gz
	rm texlive2022.tar.gz
	rm texlive2023.tar.gz
