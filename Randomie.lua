-- Code By Omaraldin#1619

local map = [[<C><P DS="m;552,367,69,365,235,367,690,365,407,365" Ca="" MEDATA=";;;;-0;0:::1-"/><Z><S><S T="0" X="0" Y="2" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="5,5,1754b78dd31.png"/><S T="14" X="402" Y="416" L="805" H="68" P="0,0,1,0,0,0,0,0"/><S T="14" X="-29" Y="217" L="55" H="472" P="0,0,0,0.2,0,0,0,0"/><S T="14" X="827" Y="219" L="55" H="472" P="0,0,0,0.2,0,0,0,0"/></S><D/><O/><L/></Z></C>]]
local admins = {
    'Omaraldin#1619', 'Massi#0020',
    'Uvfn#0000', 'Noooooooorr#0000',
    'Lalajb#0000', 'Ragekitteee#0015',
    'Kiwi_is_here#0558'
}
local winners = {}
local rolled = false
local rollLoopId = 0

function string.toNickname(str)
	return string.gsub(str, '(#%d%d%d%d)', '<font size="8"><g>%1</g></font>')
end

function string.split(str, sep)
	if sep == nil then sep = '%s' end
	local tbl = {}
	for a in string.gmatch(str, '([^' .. sep .. ']+)') do
		tbl[#tbl + 1] = a
	end
	return tbl
end 

function table.has(tbl, k) 
	for a, b in next, tbl do
		if (type(a) == 'string' and k == a) or b == k then
			return true
		end
	end
	return false
end

function eventNewPlayer(playerName)
	ui.addTextArea(1000, '', playerName, 330, 280, 200, 200, 0, 0)
	tfm.exec.addImage("1754b7902a1.png", ":1", 0, 10, playerName)
	tfm.exec.addImage('1754cc9cab3.png', ':2', 690, 25, playerName)
	ui.addTextArea(3000, '', playerName, 710, 45, 80, 170, 0, 0, 1, true)
end

table.foreach(tfm.get.room.playerList, eventNewPlayer)

function filterPlayers()
	local players = {}
	for k, v in next, tfm.get.room.playerList do
		if not winners[k] and not table.has(admins, k) and not v.isDead and string.sub(k, 1, 1) ~= '*' then 
			players[#players + 1] = k
		end
	end
	return players
end

function getWinner()
	local ran = {}
	local players = filterPlayers()
	for i = 1, math.random(#players) do
		ran[#ran + 1] = players[i]
	end
	return ran[math.random(#ran)]
end

function eventLoop()
	local wins = {}
	for k, v  in next, winners do 
		wins[#wins + 1] = '<J><font size="9" color="#FFD991">' .. k .. '. ' .. string.toNickname(v) .. '</font>'
	end
	ui.updateTextArea(3000, table.concat(wins, '<br>'))
end

function rollLoop()
	if rolled == true then
		local players = filterPlayers()
		local randomPlayer = players[math.random(#players)]
		if randomPlayer == nil then
			randomPlayer = 'لم يتم اختيار شخص'
		end

		ui.updateTextArea(1000, '<p align="center"><font color="#A9572E" size="19">' .. string.toNickname(randomPlayer) .. '</font></p>')
		local theRandomPlayer = tfm.get.room.playerList[randomPlayer]
		if theRandomPlayer then
			tfm.exec.addShamanObject(0, theRandomPlayer.x, theRandomPlayer.y - 70)
			for k, v in next, tfm.get.room.playerList do
				if randomPlayer == k then 
					tfm.exec.setNameColor(randomPlayer, 0xFF9500)
				else
					tfm.exec.setNameColor(k, 0)
				end
			end
		end
	end
end

function rollWinner()
    system.removeTimer(rollLoopId)
    local winner = getWinner()
    tfm.exec.setUIMapName(('<font color="#FFD96F">الــقــرعــة</font> <G>|</G> <N><font color="#FD96F">%s</font> :الفائز'):format(winner and winner or 'ﻻ أحد'))
    if winner == nil then
        ui.updateTextArea(1000, '<p align="center"><font color="#A9572E" size="19">لم يتم اختيار فائِز</font></p>')
        return
    end
    ui.updateTextArea(1000, '<p align="center"><font color="#A9572E" size="19">' .. string.toNickname(winner) .. '</font></p>')
    winners[#winners + 1] = winner
    local player = tfm.get.room.playerList[winner]
    for k, v in next, tfm.get.room.playerList do
        if v.isDead then 
            tfm.exec.respawnPlayer(k)
        end
        if k == winner then
            tfm.exec.changePlayerSize(k, 1.5)
            tfm.exec.playEmote(k, 0)
        else
            tfm.exec.playEmote(k, 5)
        end
    end
    for k, v in next, admins do
        tfm.exec.chatMessage('<ROSE>' .. printWinners() .. '</ROSE>', v)
    end
    rolled = false
end

function printWinners()
	local res = {}
	for _, k in pairs(winners) do
		res[#res + 1] = '"' .. k .. '"'
	end
	return 'local winners = {' .. table.concat(res, ', ') .. '}'
end

function eventChatCommand(playerName, cmd) 
	local args={}
    for s in cmd:gmatch("%S+") do
        table.insert(args, s)
    end
	if table.has(admins, playerName) then 
		if args[1] == 'roll' then
			rolled = not rolled
			rollLoopId = system.newTimer(rollLoop, 1000, true)
			system.newTimer(rollWinner, 40*1000, false)
        elseif args[1] == "c" then
        	tfm.exec.chatMessage("<n> "..cmd:sub(2).." <fc>["..playerName.."]</fc>")
        end
    end
end




function start()
	tfm.exec.disableAutoShaman(true)
	tfm.exec.newGame(map)
	tfm.exec.setGameTime(60*3)
	tfm.exec.disableAutoNewGame(true)
	tfm.exec.disableAutoTimeLeft(true)
	tfm.exec.disablePhysicalConsumables(true)
	tfm.exec.setUIMapName('<font color="#FFD96F">الــقــرعــة')
	system.disableChatCommandDisplay('roll')
	system.disableChatCommandDisplay('c')
end

start()
