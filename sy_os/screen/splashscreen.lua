os.loadAPI("sy_os/lib/text.lua")

function show()
    term.clear()

    text.centerText("Welcome to CC Tweak OS!")

    for j = 1, 3 do
        for i = 1, 3 do

            -- clear previous loading text
            text.LB_Text("                           ")

            -- Simulate loading animation
            text.LB_Text("Loading" .. string.rep(" .", i))
            sleep(0.2)
        end
    end

end