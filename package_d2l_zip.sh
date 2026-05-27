#!/usr/bin/env bash
# D2L ZIP per course requirement #5 (verbatim):
#   "must contains all your Dart files + Images + README.PDF"
# The full runnable Flutter / Android Studio project belongs on GitHub (requirement #4).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/HandymanPortfolio-Challenge2.zip"
STAGE="$(mktemp -d "${TMPDIR:-/tmp}/handyman_d2l_zip.XXXXXX")"
trap 'rm -rf "$STAGE"' EXIT

PKG="$STAGE/handyman_portfolio"
mkdir -p "$PKG"

cd "$ROOT"

if [[ ! -f README.pdf ]]; then
  echo "error: README.pdf missing — run: python3 generate_pdf.py" >&2
  exit 1
fi
cp -a README.pdf "$PKG/README.pdf"

for img in screenshot-*.png; do
  [[ -e "$img" ]] || continue
  cp -a "$img" "$PKG/"
done

while IFS= read -r -d '' dart; do
  destdir="$PKG/$(dirname "$dart")"
  mkdir -p "$destdir"
  cp -a "$dart" "$PKG/$dart"
done < <(find lib test -name '*.dart' -print0)

rm -f "$OUT"
( cd "$STAGE" && zip -r -q "$OUT" handyman_portfolio )

echo "Wrote $OUT"
if unzip -l "$OUT" | grep -qE '(^|/)(android|ios|web|linux|macos|windows)/'; then
  echo "error: platform folder leaked into ZIP" >&2
  exit 1
fi
if unzip -l "$OUT" | grep -qE 'pubspec\.yaml|package_d2l_zip\.sh|presentation/'; then
  echo "error: unexpected file in ZIP" >&2
  exit 1
fi
echo "OK: ZIP = all *.dart under lib/ and test/ + screenshot PNGs + README.pdf (requirement #5)."
