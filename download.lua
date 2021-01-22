local function Download(repoFile, saveAs)
    local url = "https://github.com/RaptorGsus/raptortles/" .. repoFile
    local download = http.get(url)

    if download then
        local fileContents = download.readAll()
        download.close()
    
        local file = fs.open(saveAs. "w")
        file.write(fileContents)
        file.close()
        print("Saved <" .. url .. " as " .. saveAs)
    else
        write("Download failed!")
        return false
    end
end

print("Enter the file name: ")
local input = read()
print("Save as: ")
local fileName = read()

Download(input, fileName)