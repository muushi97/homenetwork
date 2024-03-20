





DOWNLOAD_DIR="./tarballs"

all: ${DOWNLOAD_DIR}/prometheus-2.45.4.linux-amd64.tar.gz ${DOWNLOAD_DIR}/alertmanager-0.27.0.linux-amd64.tar.gz ${DOWNLOAD_DIR}/blackbox_exporter-0.24.0.linux-amd64.tar.gz

${DOWNLOAD_DIR}/prometheus-2.45.4.linux-amd64.tar.gz:
	mkdir -p ${DOWNLOAD_DIR}
	wget -P ${DOWNLOAD_DIR} https://github.com/prometheus/prometheus/releases/download/v2.45.4/prometheus-2.45.4.linux-amd64.tar.gz

${DOWNLOAD_DIR}/alertmanager-0.27.0.linux-amd64.tar.gz:
	wget -P ${DOWNLOAD_DIR} https://github.com/prometheus/alertmanager/releases/download/v0.27.0/alertmanager-0.27.0.linux-amd64.tar.gz

${DOWNLOAD_DIR}/blackbox_exporter-0.24.0.linux-amd64.tar.gz:
	wget -P ${DOWNLOAD_DIR} https://github.com/prometheus/blackbox_exporter/releases/download/v0.24.0/blackbox_exporter-0.24.0.linux-amd64.tar.gz
