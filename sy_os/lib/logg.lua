function logg(message)
    if not fs.exists("sy_tmp") then
        fs.makeDir("sy_tmp")
    end

    local logFile = fs.open("sy_tmp/sy_log.txt", "a")
    logFile.writeLine(message)
    logFile.close()
end