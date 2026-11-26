#!/usr/bin/env bash
# Generate a new problem folder with 9 language stubs + README.
# Usage: ./scripts/new.sh <number> <slug> "<Topic>"
# Example: ./scripts/new.sh 1 two-sum "Hashmap"
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <number> <slug> \"<Topic>\"" >&2
  echo "Example: $0 1 two-sum \"Hashmap\"" >&2
  exit 1
fi

NUM="$1"
SLUG="$2"
TOPIC="$3"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PADDED="$(printf '%04d' "$NUM")"
DIR="$ROOT/${PADDED}-${SLUG}"

if [ -d "$DIR" ]; then
  echo "Folder already exists: $DIR" >&2
  exit 1
fi

mkdir -p "$DIR"
TITLE="$(echo "$SLUG" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) substr($i,2)}}1')"

cat > "$DIR/README.md" <<EOF
# ${NUM}. ${TITLE}

- **Topic:** ${TOPIC}
- **Link:** https://leetcode.com/problems/${SLUG}/
- **Difficulty:** _TBD_

## Approach

_Describe the idea._

## Complexity

- Time: O(?)
- Space: O(?)

## Languages

- [ ] Python
- [ ] Java
- [ ] C++
- [ ] JavaScript
- [ ] C#
- [ ] Go
- [ ] TypeScript
- [ ] Kotlin
- [ ] Ruby
EOF

cat > "$DIR/solution.py" <<'EOF'
class Solution:
    def solve(self):
        pass
EOF

cat > "$DIR/Solution.java" <<'EOF'
class Solution {
    // TODO
}
EOF

cat > "$DIR/solution.cpp" <<'EOF'
class Solution {
public:
    // TODO
};
EOF

cat > "$DIR/solution.js" <<'EOF'
// TODO
EOF

cat > "$DIR/Solution.cs" <<'EOF'
public class Solution {
    // TODO
}
EOF

cat > "$DIR/solution.go" <<'EOF'
package main

// TODO
EOF

cat > "$DIR/solution.ts" <<'EOF'
export {};
// TODO
EOF

cat > "$DIR/Solution.kt" <<'EOF'
class Solution {
    // TODO
}
EOF

cat > "$DIR/solution.rb" <<'EOF'
# TODO
EOF

echo "Created $DIR with 9 language stubs + README."
