#!/usr/bin/env bash
set -euo pipefail

CASK_NAME="$1"
TAP_NAME="$2"
CASK_PATH="Casks/${CASK_NAME}.rb"
SHA_FILE="SHA256SUMS"

LATEST_VERSION=$(curl -sL "$cask_url/releases/latest" | grep -oE '/tag/v[0-9.]+' | head -n1 | sed 's|/tag/v||')
echo "🔍 Latest version: $LATEST_VERSION"

CURRENT_VERSION=$(grep -oE 'version\s+"[^"]+"' "$CASK_PATH" | head -1 | cut -d'"' -f2)
echo "📦 Current cask version: $CURRENT_VERSION"

if [[ "$CURRENT_VERSION" == "$LATEST_VERSION" ]]; then
  echo "✅ Already up-to-date."
  exit 0
fi

SHA_URL="$cask_url/releases/download/v${LATEST_VERSION}/SHA256SUMS"
curl -sL -o "$SHA_FILE" "$SHA_URL"

SHA_ARM=$(grep "Cartero-${LATEST_VERSION}-macOS-arm64.dmg" "$SHA_FILE" | awk '{print $1}')
SHA_INTEL=$(grep "Cartero-${LATEST_VERSION}-macOS-x64.dmg" "$SHA_FILE" | awk '{print $1}')

if [[ -z "$SHA_ARM" || -z "$SHA_INTEL" ]]; then
  echo "❌ Failed to extract SHA256 checksums."
  exit 1
fi

echo "✅ SHA256 (arm): $SHA_ARM"
echo "✅ SHA256 (intel): $SHA_INTEL"

sed -i.bak \
  -e "s|version \".*\"|version \"$LATEST_VERSION\"|" \
  -e "/on_arm/,/url/ s|sha256 \".*\"|sha256 \"$SHA_ARM\"|" \
  -e "/on_intel/,/url/ s|sha256 \".*\"|sha256 \"$SHA_INTEL\"|" \
  "$CASK_PATH"
rm "${CASK_PATH}.bak"

echo "🧪 Testing ARM64 install..."
# Uninstall first if already installed
arch -arm64 brew uninstall --cask "$CASK_NAME" 2>/dev/null || true
arch -arm64 brew install --cask --no-quarantine "$CASK_PATH" || { echo "❌ ARM install failed"; exit 1; }

echo "🧪 Testing Intel install..."
# Uninstall ARM version before installing Intel version
arch -arm64 brew uninstall --cask "$CASK_NAME" || true
if [[ -n "${CI:-}" ]]; then
  # In CI, install Intel Homebrew if needed
  if [[ ! -f "/usr/local/bin/brew" ]]; then
    echo "Installing Intel Homebrew to /usr/local..."
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || true
  fi
  # Use Intel Homebrew
  arch -x86_64 /usr/local/bin/brew install --cask --no-quarantine "$CASK_PATH" || { echo "❌ Intel install failed"; exit 1; }
else
  # Local environment
  arch -x86_64 brew install --cask --no-quarantine "$CASK_PATH" || { echo "❌ Intel install failed"; exit 1; }
fi

BRANCH="bump-${CASK_NAME}-${LATEST_VERSION}"
git checkout -b "$BRANCH"
git add "$CASK_PATH"
git commit -m "${CASK_NAME}: update to ${LATEST_VERSION}"
git push origin "$BRANCH"

gh pr create \
  --title "${CASK_NAME}: update to ${LATEST_VERSION}" \
  --body "Automated update to version ${LATEST_VERSION}." \
  --head "$BRANCH" \
  --base main

gh pr merge "$BRANCH" --merge --auto
