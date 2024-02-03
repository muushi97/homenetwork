FROM frolvlad/alpine-glibc:latest AS latex-base

ARG TEXLIVE_VERSION="2020"
ARG TEXDIR="/opt/texlive"

#ARG ARCHIVE="ftp://tug.org/historic/systems/texlive/"
ARG ARCHIVE="ftp://ftp.math.utah.edu/pub/tex/historic/systems/texlive/"

ARG TEXMFLOCAL="${TEXDIR}/texmf-local"
ARG TEXMFSYSCONFIG="${TEXDIR}/texmf-config"
ARG TEXMFSYSVAR="${TEXDIR}/texmf-var"

ARG TEXMFHOME="${TEXMFLOCAL}"
ARG TEXMFCONFIG="${TEXMFSYSCONFIG}"
ARG TEXMFVAR="${TEXMFSYSVAR}"
#ARG TEXMFHOME="~/texmf"
#ARG TEXMFCONFIG="~/.texlive/texmf-config"
#ARG TEXMFVAR="~/.texlive/texmf-var"

ENV PATH /opt/texlive/bin/x86_64-linuxmusl:$PATH

# texlive のインストール
RUN apk add --no-cache curl perl fontconfig-dev freetype-dev && \
    apk add --no-cache --virtual .fetch-deps xz tar
RUN mkdir /tmp/install-tl-unx && \
    curl -L ${ARCHIVE}${TEXLIVE_VERSION}/install-tl-unx.tar.gz | \
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
      > /tmp/install-tl-unx/texlive.profile
RUN /tmp/install-tl-unx/install-tl \
     -portable \
      --profile=/tmp/install-tl-unx/texlive.profile \
      --repository ${ARCHIVE}${TEXLIVE_VERSION}/tlnet-final/ && \
    rm -fr /tmp/install-tl-unx && \
    apk del .fetch-deps




FROM latex-base AS latex

# uplatex 系
# filefook と bxpapersize はなんか必要らしい
RUN tlmgr install \
        platex platex-tools uplatex \
        filehook bxpapersize

# 日本語系で必要 (pxchfon とか plautopatch は明示しなくてもいいかも)
RUN tlmgr install \
        collection-langjapanese \
        pxchfon plautopatch

# 数学系
RUN tlmgr install amsmath

# 参考文献系
RUN tlmgr install \
        biblatex biber \
        biblatex-chem \
        biblatex-phys \
        biblatex-nature \
        biblatex-science \
        biblatex-ieee

# RUN tlmgr install \
#         collection-fontsextra \
#         collection-fontsrecommended \
#         collection-latexextra \
#         collection-luatex \
#         collection-mathscience \
#         collection-xetex \
#         pxchfon plautopatch \
#         pxjahyper pxpgfmark \
#         biblatex biber \
#         latexmk

#RUN tlmgr install \
#        platex-tools \
#        platex uplatex \
#        pxjahyper \
#        pxpgfmark
        #gentombow
        #pxsttools

#RUN tlmgr install \
#        japanese-otf

#RUN tlmgr install \
#        mylatexformat

# RUN apk --update add --no-cache netcat-openbsd unzip

# # jlisting をダウンロードする
# #RUN mkdir -p ${TEXMFLOCAL}/source/latex/jlisting/
# #COPY ./packages/jlisting.sty ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty
# #RUN mv ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty.bak && \
# #    curl -o ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty.bz2 -O -L "https://osdn.net/frs/redir.php?m=nchc&f=mytexpert%2F26068%2Fjlisting.sty.bz2" && \
# #    bzip2 -d ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty.bz2
# RUN mkdir -p ${TEXMFLOCAL}/tex/latex/jlisting && \
#     curl -o ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty.bz2 -O -L "https://osdn.net/frs/redir.php?m=nchc&f=mytexpert%2F26068%2Fjlisting.sty.bz2" && \
#     bzip2 -d ${TEXMFLOCAL}/tex/latex/jlisting/jlisting.sty.bz2
#RUN ls -la ${TEXMFLOCAL}/tex/latex/jlisting/

# Noto Sans CJK jp
RUN curl -o /tmp/NotoSansCJKjp-hinted.zip -O -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    mkdir -p ${TEXMFLOCAL}/fonts/opentype/google/notosanscjk/ && \
    unzip -d ${TEXMFLOCAL}/fonts/opentype/google/notosanscjk/ /tmp/NotoSansCJKjp-hinted && \
    chmod 644 ${TEXMFLOCAL}/fonts/opentype/google/notosanscjk/*.otf
# Noto Serif CJK jp
RUN curl -o /tmp/NotoSerifCJKjp-hinted.zip -O -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip && \
    mkdir -p ${TEXMFLOCAL}/fonts/opentype/google/notoserifcjk/ && \
    unzip -d ${TEXMFLOCAL}/fonts/opentype/google/notoserifcjk/ /tmp/NotoSerifCJKjp-hinted && \
    chmod 644 ${TEXMFLOCAL}/fonts/opentype/google/notoserifcjk/*.otf
# Source Han Sans JP
RUN curl -o /tmp/SourceHanSansJP.zip -O -L https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip \
 && mkdir -p ${TEXMFLOCAL}/fonts/opentype/adobe/sourcehansans \
 && unzip -d ${TEXMFLOCAL}/fonts/opentype/adobe/sourcehansans/ /tmp/SourceHanSansJP.zip
# Source Han Serif JP
RUN curl -o /tmp/SourceHanSerifJP.zip -O -L https://github.com/adobe-fonts/source-han-serif/releases/download/2.001R/12_SourceHanSerifJP.zip && \
    mkdir -p ${TEXMFLOCAL}/fonts/opentype/adobe/sourcehanserif && \
    unzip -d ${TEXMFLOCAL}/fonts/opentype/adobe/sourcehanserif/ /tmp/SourceHanSerifJP.zip

RUN mktexlsr

# jlreq だけ特定のバージョンに更新する
#ARG JLREQ_VERSION="20210528"
#RUN curl -o /tmp/jlreq.zip -O -L https://github.com/abenori/jlreq/archive/refs/tags/${JLREQ_VERSION}.zip && \
#    unzip -d /tmp/ /tmp/jlreq.zip && \
#    mv ${TEXDIR}/texmf-dist/tex/latex/jlreq ${TEXDIR}/texmf-dist/tex/latex/jlreq.bak && \
#    mv /tmp/jlreq-${JLREQ_VERSION} ${TEXDIR}/texmf-dist/tex/latex/jlreq

RUN kpsewhich NotoSerifCJKjp-Regular.otf
RUN kpsewhich NotoSansCJKjp-Black.otf
RUN kpsewhich SourceHanSerifJP-Regular.otf
RUN kpsewhich SourceHanSansJP-Regular.otf

WORKDIR /workdir

CMD ["sh"]




#FROM frolvlad/alpine-glibc:latest AS latex-server
FROM latex AS latex-server

# fastapi
RUN apk add --no-cache \
        python3 \
        python3-dev \
        py3-pip \
        gcc \
        g++ \
        curl \
 && python3 -m pip install --upgrade pip --break-system-packages \
 && pip install fastapi uvicorn[standard] --break-system-packages

# for pdftocairo
RUN apk add --no-cache \
        poppler-utils poppler-data

# for pdfcrop
RUN apk add --no-cache \
        ghostscript \
 && tlmgr install pdfcrop
