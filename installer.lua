-- https://raw.githubusercontent.com/NorthWindSpaceflyTL327p/Ice-and-Fire-CC-Tweak-OS/main/installer.lua

local username = "NorthWindSpaceflyTL327p"
local repository = "Ice-and-Fire-CC-Tweak-OS"
local branch = "main"

local linkBase = "https://raw.githubusercontent.com/" .. username .. "/" .. repository .. "/" .. branch .. "/"

local function logg(message)

    print(message)

    if not fs.exists("sy_tmp") then
        fs.makeDir("sy_tmp")
    end

    local logFile = fs.open("sy_tmp/installer_log.txt", "a")
    logFile.writeLine(message)
    logFile.close()
end

local function downloadFile(url, path)

    -- Check folder existence and create if necessary
    local dir = fs.getDir(path)
    if not fs.exists(dir) then
        fs.makeDir(dir)
        logg("Created directory: " .. dir)
    end

    -- Use the http API to get the file content
    local response, err = http.get(url)
    if not response then
        logg("Error downloading " .. url .. ": " .. err)
        return false
    end

    -- Check existence of file and delete if exists
    if fs.exists(path) then
        logg("File " .. path .. " already exists. Deleting it.")
        fs.delete(path)
    end

    -- Write the downloaded content to file
    local file = fs.open(path, "w")
    file.write(response.readAll())
    file.close()
    response.close()
    logg("Successfully downloaded " .. url .. " to " .. path)
    return true
end

local function install()
    logg("Starting installation of Ice and Fire CC Tweak OS...")

    -- Read the list of files to download
    local file = fs.open("sy_tmp/installLists.txt", "r")
    local filesToDownload = {}
    if not file then
        logg("Error: Could not open installLists.txt")
        return
    end
    for line in file.readLine do
        logg("File to download: " .. line)
        table.insert(filesToDownload, line)
    end
    file.close()

    logg("Total files to download: " .. #filesToDownload)

    for _, filePath in ipairs(filesToDownload) do
        local url = linkBase .. filePath
        logg("Downloading " .. filePath .. "...")
        local success = downloadFile(url, filePath)
        if not success then
            -- Continue even if a file fails to download
            logg("Warning: Failed to download " .. filePath .. ". Continuing installation...")
        end
    end

    logg("Installation completed successfully!")
end


downloadFile(linkBase .. "installLists.txt", "sy_tmp/installLists.txt")

install()

-- Reboot the system to apply changes
logg("Rebooting system to apply changes...")
sleep(2)
os.reboot()