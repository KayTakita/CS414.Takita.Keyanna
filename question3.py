# ----- 3. Floating Point Numbers -----

pattern = r"^[+-]?\d*\.?\d+$"

tests = [
    "12.5",
    "-3.14",
    "+42"
]

for t in tests:
    print(t, "->", bool(re.match(pattern, t)))

