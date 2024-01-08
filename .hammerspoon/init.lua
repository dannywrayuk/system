local switchWindow = function(names)
    return function()
        for _, name in ipairs(names) do
            local app = hs.application.find(name);
            if app == nil then
                print("Cant find app: ".. name);
            elseif app:mainWindow() == nil then
                print("App not running:".. name);
            else
                app:activate();
                return;
            end
        end
    end
end

hs.hotkey.bind({"ctrl"}, "1", switchWindow({"Chrome"}))
hs.hotkey.bind({"ctrl"}, "2", switchWindow({"Obsidian", "Microsoft Teams"}))
hs.hotkey.bind({"ctrl"}, "3", switchWindow({"iTerm2", "Code"}))
hs.hotkey.bind({"ctrl"}, "4", switchWindow({"Microsoft Teams"}))
