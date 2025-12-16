-- Include necessary modules
os.loadAPI("sy_os/lib/logg.lua")

-- Start the kernel
logg.logg("Starting CC Tweak OS Kernel...")
-- (Kernel code would go here)
logg.logg("CC Tweak OS Kernel started successfully.")




-- Load screen
os.loadAPI("sy_os/screen/splashscreen.lua")

sy_os.screen.splashscreen.show()

os.loadAPI("sy_os/screen/login.lua")

sy_os.screen.login.show()