from typing import Optional

import base64

from pydantic import BaseModel
from fastapi import FastAPI, Query
from fastapi.responses import HTMLResponse

from utils import ensure_dir, Command, Script


directory: str = "/working-directory"


class TeXContent(BaseModel):
    preamble: str
    document: str



app = FastAPI()

@app.get("/")
def read_root():
    return { "Hello": "World" }

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return { "item_id": item_id, "q": q }



@app.get("/shell/{command}")
def run_command(command: str, options: list[str] = Query(default=[])):
    result = subprocess.run([ command ] + options, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return {
        "code": result.returncode,
        "stdout": result.stdout,
        "stderr": result.stderr,
    }


@app.put("/tex2svg/{basename}")
def put_tex2svg(basename: str, texcontent: TeXContent):
    # 作業用ディレクトリの存在を保証する
    directory: str = "/working-directory"
    ensure_dir(directory)

    # crop するときの周辺サイズ
    top: int = 1
    bottom: int = 1
    left: int = 1
    right: int = 1

    # TeX エンジン
    tex_engine: str = "uplatex"
    # dvi
    dvi: str = "dvipdfmx"

    # 関連するファイル名を生成する
    texfile: str     = f"{directory}/{basename}.ltx"
    dvifile: str     = f"{directory}/{basename}.dvi"
    fullpdffile: str = f"{directory}/{basename}.full.pdf"
    pdffile: str     = f"{directory}/{basename}.pdf"
    svgfile: str     = f"{directory}/{basename}.svg"
    pngfile: str     = f"{directory}/{basename}.png"

    # TeX ファイルを保存する
    with open(texfile, mode="w", encoding="utf-8") as f:
        f.write("\n".join([
            texcontent.preamble,
            r"\begin{document}",
            texcontent.document,
            r"\end{document}",
        ]))

    # script
    def builder():
        yield "tex",  Command([ tex_engine, "-halt-on-error", "-interaction=nonstopmode", "-file-line-error", "--output-directory", directory, texfile ])
        yield "dvi",  Command([ dvi, dvifile, "-o", pdffile ])
        #yield "mv",   Command([ "mv", pdffile, fullpdffile ])
        #yield "crop", Command([ "pdfcrop", "--margins", f"{left} {top} {right} {bottom}", fullpdffile, pdffile ])
        yield "svg",  Command([ "pdftocairo", "-svg", pdffile, svgfile ])
        #yield "png",  Command([ "pdftocairo", "-singlefile", "-png", pdffile, pngfile ])
    results: list[Script.Result] = [ ]
    for r in Script(builder()).run():
        results.append(r)
        if r.result.return_code != 0:
            return { "results": results }

    # SVG を読み込む
    with open(svgfile, mode="r", encoding="utf-8") as f:
        svg = f.read()

    return { "svg": svg, "results": results }

@app.get("/svg/{basename}", response_class=HTMLResponse)
def get_svg(basename: str):
    with open(f"{directory}/{basename}.svg", mode="r", encoding="utf-8") as f:
        svg = f.read()
    return svg

#@app.get("/png/{basename}")
#def get_png(basename: str):
#    with open(f"{directory}/{basename}.png", mode="rb") as f:
#        png = f.read()
#    return "hoge"
#    #return base64.b64encode(png)



