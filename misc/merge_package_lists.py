FILES = [
    'pkg-expl-inst.txt',
    'pkg-not-dep.txt',
]


def read_file(path: str, out=[]) -> list:
    with open(path, 'r') as file:
        for line in file:
            if line.strip() not in out:
                out.append(line.strip())
    return out


def write_file(path: str, pkg_list: list):
    with open(path, 'w') as file:
        for pkg in pkg_list:
            file.write(pkg + '\n')
    return


def merge(out_path: str):
    pkgs = []

    for liste in FILES:
        pkgs = pkgs + read_file(liste, pkgs)

    write_file(out_path, pkgs)


if __name__ == "__main__":
    merge("pkg-merged.txt")
