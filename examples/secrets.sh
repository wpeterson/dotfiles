echo "Load 1Password secrets? (y/n)"
read -r answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
  echo "Pre-loading 1Password secrets..."
  export RAILS_MASTER_KEY=$(op read -f --account babylist.1password.com --no-newline "op://Engineering/Rails Master Keys/development")
else
    echo "Skipping 1Password secrets load."
fi
