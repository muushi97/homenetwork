import os

from typing import Iterator
import subprocess

from pydantic import BaseModel



def ensure_dir(directory: str) -> None:
    if not os.path.exists(directory):
        os.mkdir(directory)



class Command:
    class Result(BaseModel):
        cmd: list[str]
        return_code: int
        stdout: str
        stderr: str

    def __init__(self, cmd: list[str]) -> None:
        self.__cmd: list[str] = cmd

    def run(self) -> Result:
        result = subprocess.run(
            self.__cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            encoding="utf-8",
        )
        return Command.Result(
            cmd=self.__cmd,
            return_code=result.returncode,
            stdout=result.stdout,
            stderr=result.stderr,
        )

class Script:
    class Result(BaseModel):
        name: str
        result: Command.Result

    def __init__(self, lines: Iterator[tuple[str, Command]]) -> None:
        self.__lines: Iterator[tuple[str, Command]] = lines

    def lines(self) -> Iterator[tuple[str, Command]]:
        return self.__lines

    def run(self) -> Iterator[Result]:
        for n, cmd in self.lines():
            yield Script.Result(name=n, result=cmd.run())
