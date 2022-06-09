from pprint import pprint
from pathlib import Path

import numpy as np
import pandas as pd


HERE = Path(__file__).parent

ps = HERE.glob("**/*config.sh_*")

ds = []
for p in sorted(ps):
    print(p.as_posix())

    dir0 = p.relative_to(HERE).parts[0]
    assert dir0.startswith("BR_")
    br = dir0[3:]

    d = {"_branch_id": br}
    with open(p) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            else:
                k, v = line.split("=")
                d[k] = v.strip("\"'")
    ds.append(d)

df0 = pd.DataFrame(ds)
df = df0.sort_index(axis="columns")
print(df)


def get_defaults(df):
    """Find columns where there is only one unique non-NaN value,
    and extract those key-value pairs."""
    defaults = {}
    for k, uniques in df.apply(lambda x: x.unique(), axis="rows").items():
        nna = ~ pd.isna(uniques)
        n = np.count_nonzero(nna)
        if n <= 1:
            # print(k, uniques)
            vs = uniques[nna]
            assert vs.size == 1
            defaults[k] = vs[0]

    return defaults


print()
print("Overall defaults:")
defaults = get_defaults(df)
pprint(defaults)
print(len(defaults))
        
assert set(df.MACHINE.unique()) == {"hera", "wcoss_dell_p3"}

print()
print("Hera defaults (in addition):")
hera = df.query("MACHINE == 'hera'").dropna(axis="columns", how="all")
hera_defaults = get_defaults(hera)
hera_defaults_new = {k: v for k, v in hera_defaults.items() if k not in defaults}
pprint(hera_defaults_new)
print(len(hera_defaults_new))

print()
print("WCOSS defaults (in addition):")
wcoss = df.query("MACHINE == 'wcoss_dell_p3'").dropna(axis="columns", how="all")
wcoss_defaults = get_defaults(wcoss)
wcoss_defaults_new = {k: v for k, v in wcoss_defaults.items() if k not in defaults}
pprint(wcoss_defaults_new)
print(len(wcoss_defaults_new))

defs = set([*defaults, *hera_defaults_new])
d = {k: v for k, v in df.iloc[9].items() if k not in defs and not pd.isna(v)}
pprint(d)
d = {k: v for k, v in df.iloc[8].items() if k not in defs and not pd.isna(v)}
pprint(d)
