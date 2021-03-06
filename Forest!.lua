--
-- Forest Festeval Countdown v1
-- 2020/10/19

-- For Transformice
-- By Noooooooorr#0000

local TFM = tfm.exec
local cat = {}
local player = {}
local spawn_points = {}
local time = {min=5,sec=0,halfsec=1}
local countdown = true
local hellomessage = "!مرحبًا بك في غرفة فعالية الغابة \n  .ثوانٍ <b><n>"..time.sec.."</n></b> دقائق و <b><n>"..time.min.."</n></b> ستبدأ الفعالية بعد"
local game = {
    name = "Forest Festeval!",
    names = {},
    admins = {["Ragekitteee#0015"] = true,["Noooooooorr#0000"] = true,["Kiwi_is_here#0558"] = true,["Uvfn#0000"] = true,["Lalajb#0000"] = true,["Omaraldin#1619"] = true,["Massi#0010"] = true},
    xml = '<C><P L="1000" Ca="" MEDATA="9,1;;;;-0;0:::1-"/><Z><S><S T="0" X="5" Y="5" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="0,0,1755054c73a.png"/><S T="0" X="5" Y="5" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" N="" i="0,0,17550554527.png"/><S T="14" X="500" Y="405" L="1005" H="63" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="14" X="-31" Y="273" L="1005" H="63" P="0,0,0.3,0.2,-90,0,0,0" N=""/><S T="14" X="1034" Y="296" L="1005" H="63" P="0,0,0.3,0.2,-90,0,0,0" N=""/><S T="14" X="495" Y="8" L="1015" H="63" P="0,0,0.3,0.2,-180,0,0,0" N=""/><S T="14" X="404" Y="113" L="78" H="26" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="401" Y="235" L="117" H="57" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="909" Y="209" L="85" H="10" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="990" Y="127" L="62" H="170" P="0,0,0.3,0.2,0,0,0,0"/></S><D><DS X="399" Y="359"/></D><O><O X="706" Y="352" C="11" P="0,0"/></O><L/></Z></C>',
    stuff = {
        developer = "Noooooooor#0000"
    },
    cat = {
        left = {"17503a53fcd.png","17503a57857.png","17503a6df0c.png"},
        right = {"17503d8c2e2.png","17503d82867.png","17503d7b785.png"},
    },
    isabel = {"1755051e870.png","1755051ffe2.png","17550521753.png"},
    keyboard_keys = {32,1,2,3,4,0},
    commands = {"fc","c"},
}

TFM.disableAutoScore(true)
TFM.disableAutoShaman(true)
TFM.disableAfkDeath(true)
TFM.disablePhysicalConsumables(true)
TFM.disablePhysicalConsumables(true)
TFM.disableAutoNewGame(true)
TFM.newGame(game.xml)

cat.body = {}

function string.name(name)
	if game.names[name] then
		return game.names[name]
	else
		local hashtag,hashtagColor = "(#%d%d%d%d)","<font size='10'><g>%1</g></font>"
		game.names[name] = string.gsub(name, hashtag, hashtagColor)
		return game.names[name]
	end
end

function newTimer(coro, time)
    local s = 1000/time
    local timers = {}
    for t = 0, 1000 - s, s do
        system.newTimer(function () table.insert(timers, system.newTimer(function() coro() end, 1000, true)) end, 1000 + t, false)
    end
end

function eventNewGame()
    setSpawnPoints()
    for _,point in pairs(spawn_points) do 
        cat.spawn(point)
    end
end

function updatewings(name,facing)
    if player[name].flying then
        if facing then
            if player[name].wing then
                TFM.removeImage(player[name].wing)
                if player[name].facingLeft then
                    player[name].wing = TFM.addImage( "174f522620d.png", "$"..name, 0, -20)
                else
                    player[name].wing = TFM.addImage( "174f525af4a.png", "$"..name, -35, -20)
                end
            end
        else
            if player[name].facingLeft then
                player[name].wing = TFM.addImage( "174f522620d.png", "$"..name, 0, -20)
            else
                player[name].wing = TFM.addImage( "174f525af4a.png", "$"..name, -35, -20)
            end
        end
    end
end

function eventKeyboard(name,k,down)
    if k == 0 then
        player[name].facingLeft = true
        updatewings(name,true)
    elseif k == 2 then
        player[name].facingLeft = false
        updatewings(name,true)
    elseif down and k == 32  then
        player[name].flying = true
        updatewings(name)
    elseif not down and k == 32 then
        player[name].flying = false
        TFM.removeImage(player[name].wing)
    end
end

function eventNewPlayer(name)
    player[name] = {facingLeft = false,flying = nil , wing = nil}
    for _,k in pairs(game.keyboard_keys) do
        TFM.bindKeyboard(name, k, true,true)
        TFM.bindKeyboard(name, k, false,true)
    end
    if game.admins[name] then
        TFM.setNameColor(name,0xFF7445)
    end
    TFM.respawnPlayer(name)
    TFM.chatMessage("<font color='#CB657B'><p align='center'>"..hellomessage.."</p></font>",name)
    TFM.setUIMapName("<font color='#CB657B'>!2020 فعالية الغابة")
end

function eventLoop()
    for name in next, tfm.get.room.playerList do
        if player[name].flying then 
            TFM.movePlayer(name, 0, 0, true, 0, -50, false)
        end
    end
    if countdown and time.min >= 0 and time.sec >= 0 then
        time.halfsec = time.halfsec - 0.5
        if time.sec < 10 and time.min < 10 then
            ui.addTextArea(2, "<p align='center'><font size='20' color='#010101'>:الوقت المتبقي للمسابقة</font><font size='17' color='#010101'>\n 0"..time.min.." : 0"..time.sec.."", nil, 257, 270, 289, 100, 0x0, 0x0, 1, false)
            ui.addTextArea(1, "<p align='center'><font size='20' color='#CB657B'>:الوقت المتبقي للمسابقة</font><font size='17'>\n 0"..time.min.." : 0"..time.sec.."", nil, 255, 270, 289, 100, 0x0, 0x0, 1, false)
        elseif time.sec > 10 and time.min < 10 then
            ui.addTextArea(2, "<p align='center'><font size='20' color='#010101'>:الوقت المتبقي للمسابقة</font><font size='17' color='#010101'>\n0"..time.min.." : "..time.sec.."", nil, 257, 270, 289, 100, 0x0, 0x0, 1, false)
            ui.addTextArea(1, "<p align='center'><font size='20' color='#CB657B'>:الوقت المتبقي للمسابقة</font><font size='17'>\n0"..time.min.." : "..time.sec.."", nil, 255, 270, 289, 100, 0x0, 0x0, 1, false)
        elseif time.sec > 10 and time.min > 10 then
            ui.addTextArea(2, "<p align='center'><font size='20' color='#010101'>:الوقت المتبقي للمسابقة</font><font size='17' color='#010101'>\n"..time.min.." : "..time.sec.."", nil, 257, 270, 289, 100, 0x0, 0x0, 1, false)
            ui.addTextArea(1, "<p align='center'><font size='20' color='#CB657B'>:الوقت المتبقي للمسابقة</font><font size='17'>\n"..time.min.." : "..time.sec.."", nil, 255, 270, 289, 100, 0x0, 0x0, 1, false)
        elseif time.sec > 10 and time.min < 10 then
            ui.addTextArea(2, "<p align='center'><font size='20' color='#010101'>:الوقت المتبقي للمسابقة</font><font size='17' color='#010101'>\n 0"..time.min.." : "..time.sec.."", nil, 257, 270, 289, 100, 0x0, 0x0, 1, false)
            ui.addTextArea(1, "<p align='center'><font size='20' color='#CB657B'>:الوقت المتبقي للمسابقة</font><font size='17'>\n 0"..time.min.." : "..time.sec.."", nil, 255, 270, 289, 100, 0x0, 0x0, 1, false)
        else
            ui.addTextArea(1, "<p align='center'><font size='20' color='#010101'>:الوقت المتبقي للمسابقة</font><font size='17' color='#010101'>\n "..time.min.." : "..time.sec.."", nil, 257, 270, 289, 100, 0x0, 0x0, 1, false)
            ui.addTextArea(1, "<p align='center'><font size='20' color='#CB657B'>:الوقت المتبقي للمسابقة</font><font size='17'>\n "..time.min.." : "..time.sec.."", nil, 255, 270, 289, 100, 0x0, 0x0, 1, false)
        end
        if time.halfsec == 0 then
            time.halfsec = 1
            time.sec = time.sec - 1
        elseif time.sec == 0 then
            time.sec= 59
            time.min = time.min - 1
        end
    end
    if time.min <= 0 and time.sec <= 0 then
        ui.addTextArea(2, "<p align='center'><font size='20' color='#010101'>ستبدأ الفعالية في غضون لحظات</font>", nil, 257, 270, 289, 100, 0x0, 0x0, 1, false)
        ui.addTextArea(1, "<p align='center'><font size='20' color='#CB657B'>ستبدأ الفعالية في غضون لحظات</font>", nil, 255, 270, 289, 100, 0x0, 0x0, 1, false)
        countdown = false
    end
end

function cat.animation(Cat)
    if Cat.img == 1 then 
        Cat.add = 1 
    elseif Cat.img == 3 then
        Cat.add = -1 
    end
end

function cat.spawn(point)
    local x = point.x
    local y = point.y
    print(x..y)
    local side = point.side
    local id = #cat.body + 1 
    local Cat = cat.body[id]
    Cat = {id=id, x=x, y=y, side=side ,object = TFM.addShamanObject(6300, x, y,0,0,false) ,image = nil , timer = nil, img = 1, add = 1}
    Cat.timer = newTimer(function ()
        cat.animation(Cat)
        if Cat.img <= 3 then 
            Cat.img = Cat.img + Cat.add
        end
        TFM.addImage(game.cat[Cat.side][Cat.img], "#"..Cat.object,-75,-70)
    end,5)
end

TFM.addImage("1755051e870.png", "_9",100,320)



function getValue(theValue,c)
    return tonumber(theValue:match(('%s="([^"]+)"'):format(c))) or theValue:match(('%s="([^"]+)"'):format(c)) or theValue:match(('%s=""'):format(c))
end

function setSpawnPoints()
    local xml = game.xml
    for point in xml:gmatch("<O [^/]+/>") do
        local x = getValue(point,"X")
        local y = getValue(point,"Y")
        local p = getValue(point,"P")
        if p == "0,0" then p = "left" else p = "right" end
        spawn_points[#spawn_points+1] = {y = y , x = x , side = p}
    end
end

function eventChatCommand(n, cmd)
    local args={}
    for s in cmd:gmatch("%S+") do
        table.insert(args, s)
    end
    if game.admins[n] then 
        if args[1] == "fc" then
            for name in next ,game.admins do
                TFM.chatMessage("<n> "..cmd:sub(3).." <font color='#51FFC1'>["..string.name(n).."][FunCorp] </font>", name)
            end
        elseif args[1] == "c" then
            TFM.chatMessage("<n> "..cmd:sub(2).." <fc>["..string.name(n).."]</fc>")
        end
    end
end

function main()
    for name in next,tfm.get.room.playerList do
        eventNewPlayer(name)
    end
    for _,cmd in pairs (game.commands) do
        system.disableChatCommandDisplay(cmd)
    end
end

main()
