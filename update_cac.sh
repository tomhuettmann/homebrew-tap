#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

VERSION=$1
FORMULA_FILE="Formula/cac.rb"
URL="https://github.com/tomhuettmann/cac/releases/download/v${VERSION}/cac-${VERSION}-macos-arm64.tar.gz"

echo "Fetching SHA256 for version ${VERSION}..."
SHA256_URL="${URL}.sha256"
SHA256=$(curl -sL "$SHA256_URL" | awk '{print $1}')

if ! echo "$SHA256" | grep -qE '^[a-fA-F0-9]{64}$'; then
    echo "❌ Error: Invalid SHA256 format received: $SHA256"
    echo "Expected 64 hexadecimal characters"
    exit 1
fi

echo "SHA256: $SHA256"
echo "Updating formula to version ${VERSION}..."

# Update version and sha256 in formula file
sed -i '' "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"${SHA256}\"/" "$FORMULA_FILE"

echo ""
echo "✅ Updated cac to version ${VERSION}"
echo ""
echo "Next steps:"
echo "  git add $FORMULA_FILE && git commit -m 'update cac to ${VERSION}' && git push"
