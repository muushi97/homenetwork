FROM debian:bookworm-slim AS texlive-base

#ARG ARCHIVE="ftp://tug.org/historic/systems/texlive/"
ARG ARCHIVE="ftp://ftp.math.utah.edu/pub/tex/historic/systems/texlive/"

ARG TEXLIVE_VERSION="2020"
ARG TEXDIR="/opt/texlive"

ARG TEXMFLOCAL="${TEXDIR}/texmf-local"
ARG TEXMFSYSCONFIG="${TEXDIR}/texmf-config"
ARG TEXMFSYSVAR="${TEXDIR}/texmf-var"

#ARG TEXMFHOME="~/texmf"
ARG TEXMFHOME="${TEXMFLOCAL}"
#ARG TEXMFCONFIG="~/.texlive/texmf-config"
ARG TEXMFCONFIG="${TEXMFSYSCONFIG}"
#ARG TEXMFVAR="~/.texlive/texmf-var"
ARG TEXMFVAR="${TEXMFSYSVAR}"

# curl はインストーラを持ってくるのに必要
# perl-modules はインストール時に必要
RUN apt-get update && apt-get install -y \
    curl perl-modules \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/install-tl-unx \
 && curl -L ${ARCHIVE}${TEXLIVE_VERSION}/install-tl-unx.tar.gz | \
      tar -xz -C /tmp/install-tl-unx --strip-components=1

RUN printf "%s\n" \
      "selected_scheme scheme-basic" \
      "" \
      "TEXDIR ${TEXDIR}" \
      "TEXMFLOCAL ${TEXMFLOCAL}" \
      "TEXMFSYSCONFIG ${TEXMFSYSCONFIG}" \
      "TEXMFSYSVAR ${TEXMFSYSVAR}" \
      "TEXMFHOME ${TEXMFHOME}" \
      "TEXMFCONFIG ${TEXMFCONFIG}" \
      "TEXMFVAR ${TEXMFVAR}" \
      "" \
      "binary_x86_64-darwin 0" \
      "binary_x86_64-linux 1" \
      "binary_win32 0" \
      "" \
      "option_doc 0" \
      "option_src 0" \
      "" \
      "instopt_portable 1" \
      "" \
      "in_place 0" \
      "option_adjustrepo 0" \
      "option_autobackup 0" \
      "option_backupdir tlpkg/backups" \
      "option_desktop_integration 0" \
      "option_file_assocs 0" \
      "option_fmt 1" \
      "option_letter 0" \
      "option_menu_integration 0" \
      "option_path 0" \
      "option_post_code 1" \
      "option_sys_bin /usr/local/bin" \
      "option_sys_info /usr/local/share/info" \
      "option_sys_man /usr/local/share/man" \
      "option_w32_multi_user 0" \
      "option_write18_restricted 1" \
      "portable 0" \
      "" \
      "tlpdbopt_install_docfiles 0" \
      "tlpdbopt_install_srcfiles 0" \
      > /tmp/install-tl-unx/texlive.profile \
 && /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile \
      -portable \
      --repository ${ARCHIVE}${TEXLIVE_VERSION}/tlnet-final/


