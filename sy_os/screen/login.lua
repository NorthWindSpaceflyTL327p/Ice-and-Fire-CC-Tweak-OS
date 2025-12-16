function show()
    while true do
        term.clear()
        term.setCursorPos(2,2)
        print("Welcome to CC Tweak OS!")

        term.setCursorPos(2,3)
        print("Login Username: ")
        term.setCursorPos(18,3)
        local username = read()

        term.setCursorPos(2,4)
        print("Password: ")
        term.setCursorPos(12,4)
        local password = read("*")

        term.clear()
        term.setCursorPos(2,2)

        if username == "admin" and password == "1234" then
            print("Login successful! Welcome, " .. username .. ".")
            break
        else
            print("Login failed! Invalid username or password.")
            sleep(2)
        end
    end
end