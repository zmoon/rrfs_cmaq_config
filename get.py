from pathlib import Path


HERE = Path(__file__).parent

ps = HERE.glob("**/*config.sh_*")

for p in sorted(ps):
    print(p.as_posix())

    d = {}
    with open(p) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            else:
                k, v = line.split("=")
                d[k] = v.strip("\"'")
    print(d)

