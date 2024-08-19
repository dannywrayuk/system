HOST=$(hostname | cut -d. -f1)
echo  "{ 
    withDefault = config: { 
        $HOST = (config.\${\"$HOST\"} or config.\${config.default}) { 
                user = \"$USER\"; 
        }; 
    };
    user = \"$USER\";
    host=\"$HOST\";
}" > ./nix/host.nix
git add --intent-to-add ./nix/host.nix
git update-index --assume-unchanged ./nix/host.nix
