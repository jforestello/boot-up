# Generate SSH key if it doesn't exist
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
  echo "Generating SSH key..."
  ssh-keygen -t ed25519 -C "$USER@$(hostname)" -f "$SSH_KEY" -N ""
else
  echo "SSH key already exists."
fi

# Start SSH agent and add key
eval "$(ssh-agent -s)"
mkdir -p ~/.ssh
touch ~/.ssh/config

# Add to ssh config
if ! grep -q "Host github.com" ~/.ssh/config; then
cat <<EOL >> ~/.ssh/config

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $SSH_KEY
EOL
fi

ssh-add --apple-use-keychain "$SSH_KEY"

# Copy SSH public key to clipboard
pbcopy < "${SSH_KEY}.pub"
echo "✅ SSH public key copied to clipboard."

