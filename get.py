from pprint import pprint
from pathlib import Path

import numpy as np
import pandas as pd
import yaml


HERE = Path(__file__).parent

ps = HERE.glob("**/*config.sh_*")

ds = []
for p in sorted(ps):
    print(p.as_posix())

    prel = p.relative_to(HERE)
    dir0 = prel.parts[0]
    assert dir0.startswith("BR_")
    br = dir0[3:]

    sub_id = np.nan
    if prel.parts[1] not in {"hera", "wcoss_dell_p3", "orion"}:
        sub_id = prel.parts[1]

    d = {"_fn": p.name, "_branch_id": br, "_sub_id": sub_id}
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


def get_defaults(df, *, exclude=None):
    """Find columns where there is only one unique non-NaN value,
    and extract those key-value pairs."""
    if exclude is None:
        exclude = set()
    defaults = {}
    for k, uniques in df.apply(lambda x: x.unique(), axis="rows").items():
        if k in exclude:
            continue
        nna = ~pd.isna(uniques)
        n = np.count_nonzero(nna)
        if n <= 1:
            vs = uniques[nna]
            assert vs.size == 1
            defaults[k] = vs[0]

    return defaults


print()
print("Overall defaults:")
defaults = get_defaults(df)
pprint(defaults)
fixed = set(defaults)
print(len(fixed), "settings are the same in all files")

assert set(df.MACHINE.unique()) == {"hera", "wcoss_dell_p3", "orion"}

# Extract machine-specific settings
defaults_mach = {}
for mach in ["hera", "wcoss_dell_p3", "orion"]:
    print(mach)
    defaults_ = get_defaults(
        df.query(f"MACHINE == '{mach}'").dropna(axis="columns", how="all"),
        exclude=fixed | {"MACHINE"},
    )
    pprint(defaults_)
    defaults_mach[mach] = defaults_
    # fixed.update(defaults_mach)

# Extract branch-specific settings
defaults_br = {}
for br in df._branch_id.unique():
    print(br)
    defaults_ = get_defaults(
        df.query(f"_branch_id == '{br}'").dropna(axis="columns", how="all"),
        exclude=fixed | {"_branch_id"},
    )
    pprint(defaults_)
    defaults_br[br] = defaults_

# Extract remaining settings for individual config files
remaining = []
for _, row in df.iterrows():
    mach = row.MACHINE
    br = row._branch_id
    already_set = fixed.union(defaults_mach[mach], defaults_br[br])
    already_set -= {"MACHINE", "_branch_id"}  # need these to get their defaults
    d = row.to_dict()
    d_ = {k: v for k, v in d.items() if k not in already_set and not pd.isna(v)}
    if "_sub_id" not in d_:
        d_["_sub_id"] = None
    remaining.append(d_)

# Write file
with open("config.yml", "w") as f:
    f.write("# Config settings for generating individual config files\n#\n")

    yaml.dump({"defaults": defaults}, f)

    f.write("\n")
    yaml.dump({"mach_defaults": defaults_mach}, f)

    f.write("\n")
    yaml.dump({"branch_defaults": defaults_br}, f)

    f.write("\n")
    yaml.dump({"configs": remaining}, f, default_flow_style=False)
