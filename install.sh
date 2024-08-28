echo "Installing nix"
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Generating Host file"
./nix/generate-host.sh

echo "Creating Project Directory"
mkdir -p $HOME/project
