print("\n=================\nCataloger v1.0.0 ("..os.time(os.date("!*t"))..")\n=================")

local hotkey = "B"

print("Listening for hotkey '" .. hotkey .. "'")

function screenshotAndSave()	
	local prefix = ".\\catalog\\rawdata\\"  
	.. emu.getsystemid()
	.. '__'
	.. gameinfo.getromname()
	.. '__'
	.. gameinfo.getromhash() 
	.. '__'
	.. os.time(os.date("!*t"))

	client.screenshot(prefix .. '.png')
	savestate.save(prefix .. '.save')
	gui.pixelText(0,0,"saved")
	gui.text(0, 0, "saved", "fff")

	drawMessage("!.. SAVED ..!")
	-- print("Saved -" .. prefix)
end

function drawMessage(message)
	buffer = 0 -- Sets countdown location. Adding 8 makes it appear correct for the NES.
	if emu.getsystemid() == "NES" then
		buffer = 8
	end
	gui.drawBox(client.bufferwidth()/2-60,buffer,client.bufferwidth()-(client.bufferwidth()/2+1-60),15+buffer,"white","black")

	gui.drawText(client.bufferwidth()/2,buffer,message,"red",null,null,null,"center")
end

local table={}

while true do
	table=input.get()

	--print(table)

	if table[hotkey] then
		screenshotAndSave()

	
	end
	emu.frameadvance()
end
