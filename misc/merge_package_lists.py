PATH = [
    'tower_pkg.txt',
    'acer_pkg.txt'
]

EXCLUDE = [
    'tower_aur.txt',
    'acer_aur.txt',
    'think_pkg.txt'
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
    for liste in PATH:
        read_file(liste, pkgs)
    excl = []
    for liste in EXCLUDE:
        read_file(liste, excl)
    out = []
    for pkg in pkgs:
        if pkg not in excl:
            out.append(pkg)
    write_file(out_path, out)
    return


if __name__ == "__main__":
    merge("pkg_list.txt")
