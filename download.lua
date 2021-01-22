local function Download(repoFile, saveAs)
    local url = "https://raw.githubusercontent.com/RaptorGsus/raptortles/master/" .. repoFile
    local download = http.get(url)

    if download then
        local fileContents = download.readAll()
        download.close()
    
        local file = fs.open(saveAs. "w")
        file.write(fileContents)
        file.close()
        print("Saved <" .. url .. "> as <" .. saveAs .. " >")
    else
        write("Download failed!")
        return false
    end
end

local tArgs = {...}
if #tArgs == 2 then
    Download(tArgs[1], tArgs[2])
else 
    print("ERROR: download takes 2 arguments: repoFile, saveAs")
end