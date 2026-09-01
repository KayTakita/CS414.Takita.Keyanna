import re

# ----- 1. C++ Identifiers -----

pattern = r"^[A-Za-z_][A-Za-z0-9_]*$"

tests = ["student", "_count2", "2student"]

for t in tests:
    print(t, "->", bool(re.match(pattern, t)))



# ----- 2. U.S. Phone Numbers -----

pattern = r"^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4})$"

tests = [
    "(256) 658-0465",
    "256-658-0465",
    "2566580465"
]

for t in tests:
    print(t, "->", bool(re.match(pattern, t)))
