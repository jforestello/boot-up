# Install Git
if ! command -v git &>/dev/null; then
  echo "Installing Git..."
  brew install git
else
  echo "Git already installed."
fi

# Install GitHub CLI (optional but helpful)
if ! command -v gh &>/dev/null; then
  echo "Installing GitHub CLI..."
  brew install gh
fi
