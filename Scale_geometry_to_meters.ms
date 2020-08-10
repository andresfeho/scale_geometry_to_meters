resetMaxFile() #noPrompt
clearlistener()

try(
load_url = getSavepath caption:"Load OBJ's..."
filePath = load_url + "\*.obj"
	
OBJfiles = getFiles filePath
numfiles = OBJfiles.count
save_url = getSavepath caption:"Export location..."

for i in 1 to numfiles do (
	filename = filenameFromPath OBJfiles[i]
	exportname = "\\" + filename
	importFile OBJfiles[i] #noprompt
	select $*
	for c in $ do
		scale c [0.01, 0.01, 0.01]
	try(
	exportPath = save_url + exportname
	exportFile exportPath #noprompt selectedOnly:true
	)catch(
	messagebox("error exporting")
	)
	delete $
)
	
messagebox("Exporting Done!")

)catch(
	messagebox("Canceled")
)