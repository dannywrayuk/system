local function mergeTables(a, b)
    for k, v in pairs(b) do
        if type(v) == "table" then
            if type(a[k]) == "table" then
                mergeTables(a[k], v)
            else
                a[k] = v
            end
        else
            a[k] = v
        end
    end
end

return mergeTables
