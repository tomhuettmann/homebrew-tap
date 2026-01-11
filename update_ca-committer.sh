#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

VERSION=$1
FORMULA_FILE="Formula/ca-committer.rb"
URL="https://github.com/tomhuettmann/ca-committer/releases/download/v${VERSION}/cac-${VERSION}-macos-universal.tar.gz"

echo "Fetching SHA256 for version ${VERSION}..."
SHA256_URL="${URL}.sha256"
SHA256=$(curl -sL "$SHA256_URL" | awk '{print $1}')

if [ -z "$SHA256" ]; then
    echo "❌ Error: Could not fetch SHA256 from $SHA256_URL"
    echo "Make sure the release v${VERSION} exists on GitHub"
    exit 1
fi

echo "SHA256: $SHA256"
echo "Updating formula to version ${VERSION}..."

# Update version and sha256 in formula file
sed -i '' "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"${SHA256}\"/" "$FORMULA_FILE"

echo ""
echo "✅ Updated ca-committer to version ${VERSION}"
echo ""
echo "Changes:"
git diff "$FORMULA_FILE"
echo ""
echo "Next steps:"
echo "  git add $FORMULA_FILE"
echo "  git commit -m 'Update ca-committer to v${VERSION}'"
echo "  git push"
