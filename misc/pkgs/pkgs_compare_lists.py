#!/usr/bin/env python3


def read_pkg_list(filepath: str) -> list:
    with open(filepath, 'r') as file:
        pkgs = file.read().strip()
    return pkgs.split()


def check_disjoint(a: list, b: list) -> bool:
    return set(a).isdisjoint(set(b))


def get_difference(a: list, b: list) -> (list, list):
    if sorted(a) == sorted(b):
        return None, None

    aset, bset = set(a), set(b)
    missingA = list(bset - aset)
    missingB = list(aset - bset)
    return missingA, missingB


if __name__ == "__main__":
    pkgs_all     = read_pkg_list('pkgs_all.txt')
    pkgs_deps    = read_pkg_list('pkgs_dependencies.txt')
    pkgs_expl    = read_pkg_list('pkgs_explicitly.txt')
    pkgs_not_req = read_pkg_list('pkgs_not_req.txt')

    disj = check_disjoint(pkgs_deps, pkgs_expl)
    print(f"Deps and not required pkgs disjoint: {disj}")

    diffA, diffB = get_difference(pkgs_all, pkgs_deps + pkgs_expl)
    if diffA is None and diffB is None:
        print("\npkgs_all == pkgs_deps + pkgs_expl")
    else:
        print("\nPkgs missing in pkgs_all:", "\n".join(diffA), sep="\n")
        print("\nPkgs missing in other lists:", "\n".join(diffB), sep="\n")

    print("\nExplicitly Installed Packages, which are also an dependency")
    print("\n".join(list(set(pkgs_expl) - set(pkgs_not_req))))