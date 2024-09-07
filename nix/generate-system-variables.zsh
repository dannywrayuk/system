HOST=$(hostname | cut -d. -f1)
echo "{\"user\":\"$USER\", \"host\":\"$HOST\"}" > ./nix/system-variables.json
