HOST=$(hostname | cut -d. -f1)
echo  "config: { $HOST = config { user = \"$USER\"; host = \"$HOST\"; }; }" > ./host.nix
git add --intent-to-add host.nix
git update-index --assume-unchanged host.nix
