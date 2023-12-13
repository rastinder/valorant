EnablePrimaryMouseButtonEvents(true);
function OnEvent(event, arg)
local dir
    OutputLogMessage("event = %s, arg = %s\n", event, arg)
if ( IsKeyLockOn("capslock" ) then
	if (IsKeyLockOn("numlock")and IsKeyLockOn("scrolllock"))then
		dir = "down"
	elseif IsKeyLockOn("scrolllock")then
		dir = "up"
	elseif IsKeyLockOn("numlock") then
		dir = "right"
	else
		dir = "left"
	end

	if (event == "MOUSE_BUTTON_PRESSED" and arg == 3) then
		if dir == "up" then
			MoveMouseRelative(0,-5)
			OutputLogMessage("dir = %s \n",dir)
			Sleep(10)
		end
		if dir == "down" then
			MoveMouseRelative(0,5)
			OutputLogMessage("dir = %s \n",dir)
			Sleep(10)
		end
		if dir == "right" then
			MoveMouseRelative(5,0)
			OutputLogMessage("dir = %s \n",dir)
			Sleep(10)
		end
		if dir == "left" then
			MoveMouseRelative(-5,0)
			OutputLogMessage("dir = %s \n",dir)
			Sleep(10)
		end
OutputLogMessage("end \n")
end
end
end