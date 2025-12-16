function show() 
    local selected = 1
    while true do
        term.clear()
        term.setCursorPos(2,2)
        print("Welcome to your Desktop!")

        local appsPath = "sy_os/apps/"
        local apps = {}
        if fs.exists(appsPath) then
            apps = fs.list(appsPath)
            local startY = 4
            for i, app in ipairs(apps) do
                term.setCursorPos(4, startY + i - 1)
                if i == selected then
                    term.write("> " .. app)
                else
                    term.write("  " .. app)
                end
            end
        else
            term.setCursorPos(4,4)
            print("No applications found.")
        end

        local event, key = os.pullEvent("key")
        if key == keys.up then
            if selected > 1 then selected = selected - 1 end
        elseif key == keys.down then
            if selected < #apps then selected = selected + 1 end
        elseif key == keys.enter or key == keys.numPadEnter then
            if apps[selected] then
                shell.run(appsPath .. "/" .. apps[selected])
            end
        end
    end
end