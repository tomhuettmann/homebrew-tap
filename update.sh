#!/bin/bash

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <formula> <version>"
    echo "Example: $0 cac 1.0.0"
    exit 1
fi

FORMULA=$1
VERSION=$2
FORMULA_FILE="Formula/${FORMULA}.rb"

if [ ! -f "$FORMULA_FILE" ]; then
    echo "❌ Error: $FORMULA_FILE not found"
    exit 1
fi

URL_LINE=$(grep -E '^ *url "' "$FORMULA_FILE")
OLD_VERSION=$(echo "$URL_LINE" | sed -E 's|.*/download/v([^/]+)/.*|\1|')
OLD_VERSION_PATTERN=${OLD_VERSION//./\\.}
URL=$(echo "$URL_LINE" | sed -E 's/^ *url "(.*)"$/\1/' | sed "s/${OLD_VERSION_PATTERN}/${VERSION}/g")

echo "Fetching SHA256 for ${FORMULA} ${VERSION}..."
SHA256_FILE=$(curl -fsSL "${URL}.sha256") || {
    echo "❌ Error: Could not download ${URL}.sha256 (release not published yet?)"
    exit 1
}
SHA256=$(echo "$SHA256_FILE" | awk '{print $1}')

if ! echo "$SHA256" | grep -qE '^[a-fA-F0-9]{64}$'; then
    echo "❌ Error: Invalid SHA256 format received: $SHA256"
    echo "Expected 64 hexadecimal characters"
    exit 1
fi

echo "SHA256: $SHA256"
echo "Updating formula to version ${VERSION}..."

sed -i '' "/^ *url \"/s/${OLD_VERSION_PATTERN}/${VERSION}/g" "$FORMULA_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"${SHA256}\"/" "$FORMULA_FILE"

echo ""
echo "✅ Updated ${FORMULA} to version ${VERSION}"
echo ""
echo "Next steps:"
echo "  git add $FORMULA_FILE && git commit -m 'update ${FORMULA} to ${VERSION}' && git push"
