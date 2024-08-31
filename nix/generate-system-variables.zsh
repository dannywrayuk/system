HOST=$(hostname | cut -d. -f1)
echo "{\"user\":\"$USER\", \"host\":\"$HOST\"}" > $SYS_CONFIG_DIR/nix/system-variables.json
