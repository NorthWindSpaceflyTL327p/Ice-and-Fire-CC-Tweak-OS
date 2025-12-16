-- Include necessary modules
os.loadAPI("sy_os/lib/logg.lua")
os.loadAPI("sy_os/lib/text.lua")

-- Load sy_os module
os.loadAPI("sy_os/screen/splashscreen.lua")
os.loadAPI("sy_os/screen/login.lua")

-- Define sy_os table
sy_os = {
    screen = {
        splashscreen = splashscreen,
        login = login
    }
}

-- Start the kernel
logg.logg("Starting CC Tweak OS Kernel...")
logg.logg("CC Tweak OS Kernel started successfully.")

-- Show splashscreen
sy_os.screen.splashscreen.show()

-- Show login screen
sy_os.screen.login.show()