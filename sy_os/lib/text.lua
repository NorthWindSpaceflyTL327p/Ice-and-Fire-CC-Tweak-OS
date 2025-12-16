function centerText(text)
    local termWidth, termHeight = term.getSize()
    local textLength = string.len(text)

    local startX = math.floor((termWidth - textLength) / 2) + 1
    local startY = math.floor(termHeight / 2) + 1

    term.setCursorPos(startX, startY)
    print(text)
end