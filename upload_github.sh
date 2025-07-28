# Optionally, use GitHub CLI to upload key
echo "Logging into GitHub CLI (requires authentication)..."
gh auth login

read -p "Do you want to upload the SSH key to GitHub? (y/n) " UPLOAD
if [[ "$UPLOAD" == "y" ]]; then
  SSH_KEY="$HOME/.ssh/id_ed25519"
  gh ssh-key add "${SSH_KEY}.pub" --title "$(hostname)"
  echo "✅ SSH key uploaded to GitHub."
fi

# Set global Git config
read -p "Enter your Git user name: " git_user
git config --global user.name "$git_user"

read -p "Enter your Git email: " git_email
git config --global user.email "$git_email"

echo "✅ Git and SSH setup complete!"
