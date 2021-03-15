--MiceRace v1
--Released in 22/10/2020
--By Noooooooorr#0000
--22/10/2020


local TFM = tfm.exec
local GET = tfm.get
local player = {}
local game = {
    name = "Mice Race",
    names = {},
    developer = "Noooooooorr#0000",
    maps = {
        [1] = [[<C><P L="4000" G="-2,10" Ca="" MEDATA="17,1;;;;-0;0:::1-"/><Z><S><S T="12" X="2001" Y="443" L="4000" H="130" P="0,0,0.5,0.2,0,0,0,0" o="5E3947"/><S T="0" X="0" Y="0" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" N="" i="5,5,17537094312.png"/><S T="0" X="0" Y="0" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="5,5,17537088334.png"/><S T="6" X="1061" Y="158" L="54" H="54" P="0,0,0.3,0.2,0,0,0,0" m=""/><S T="14" X="-106" Y="201" L="214" H="617" P="0,0,40,0,0,0,0,0"/><S T="14" X="4108" Y="205" L="214" H="617" P="0,0,0,0,0,0,0,0"/><S T="14" X="2015" Y="-62" L="4030" H="130" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="12" X="31" Y="394" L="60" H="18" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="187" Y="397" L="226" H="26" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="581" Y="401" L="58" H="46" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="1940" Y="401" L="80" H="46" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="2281" Y="397" L="115" H="46" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="2281" Y="397" L="115" H="46" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="3160" Y="390" L="16" H="25" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="12" X="2970" Y="391" L="16" H="25" P="0,0,0.3,0.2,0,0,0,0" o="5E3947" c="4" N=""/><S T="14" X="2000" Y="91" L="4030" H="130" P="0,0,0.3,0.2,5,0,0,0" c="3" N=""/><S T="12" X="35" Y="368" L="82" H="67" P="0,0,0.3,0.2,0,0,0,0" o="324650" v="20000" m=""/><S T="8" X="220" Y="188" L="10" H="393" P="0,0,0.3,0.2,0,0,0,0" c="2" m=""/></S><D><T X="3901" Y="380" D="" CT="2"/><T X="3862" Y="380" D="" CT="2"/><F X="3862" Y="369"/><F X="3886" Y="367"/><F X="3916" Y="370"/><F X="3935" Y="374"/><F X="3923" Y="363"/><F X="3907" Y="355"/><F X="3891" Y="345"/><F X="3867" Y="340"/><F X="3848" Y="351"/><F X="3850" Y="361"/><F X="3877" Y="378"/><F X="3906" Y="380"/><F X="3917" Y="380"/><F X="3927" Y="364"/><F X="3927" Y="349"/><F X="3910" Y="324"/><F X="3889" Y="301"/><T X="3939" Y="381" D="" CT="2"/><T X="3977" Y="379" CT="2"/><T X="3880" Y="346"/><T X="3927" Y="344"/><T X="3901" Y="313"/><DS X="91" Y="371"/></D><O/><L/></Z></C>]]
    },
    admins = {["Snowvlokje#4925"] = true,["Noooooooorr#0000"] = true},
    winners = false,
    winner = "",
    keys = {0, 1, 32},
    time = 15,
    commands = {"fc","c"},
    started = false , 
    tropplein = 0 , -- The 0 means that there isn't any players limit.
    objects = {"174d12f563b.png","174d140642c.png","174db466907.png","1740cbdc8ed.png","1718e694e82.png","175049583f9.png"},
}

local langue = {
    ar = {
        welcomeMessage = "<fc><font color ='#BF4F79'><b>!!سباق الفئران</b></font> مرحبا في \n <font color ='#BF4F79'><b>المسطرة/المسافة</b></font> كل ما عليك فعله هو الضغط على زر \n .لكي تتمكن من الركض و زر السهم الأعلى للقفز  \n\n !!إحذر من أن تقوم بتكسير لوحة المفاتيح و حظا موفقا</fc>",
        winner = "!فاز بالجولة <v>%s</v>"
    },
    en = {
        welcomeMessage = "<fc>Welcome to <font color ='#BF4F79'><b>Mice Race!</b></font>\n All you have to do is press a <font color ='#BF4F79'><b>SPACEBAR</b></font> to run faster \n and the up arrow button to jump! \n\n Beware and don't crack the keyboard and good luck!!</fc>",
        winner = "<v>%s</v> wons the round!"
    }
}

function translate(id, name)
    if player[name] then
        if langue[player[name].langue] then
            if langue[player[name].langue][id] then
                return langue[player[name].langue][id]
            else
                return langue["en"][id]
            end
        elseif langue["en"] then
            return langue["en"][id]
        else
            return "error"
        end
    end
end

TFM.disableAfkDeath(true)
TFM.disableAutoNewGame(true)
TFM.disablePhysicalConsumables(true)
TFM.disableAutoScore(true)
TFM.disableDebugCommand(true)
TFM.disableAutoShaman(true)
TFM.newGame(game.maps[math.random(#game.maps)])


function string.name(name)
	if game.names[name] then
		return game.names[name]
	else
		local hashtag,hashtagColor = "(#%d%d%d%d)","<font size='10'><g>%1</g></font>"
		game.names[name] = string.gsub(name, hashtag, hashtagColor)
		return game.names[name]
	end
end

function eventNewGame()
    TFM.setUIMapName("<font color ='#FFD991'>"..game.name.."")
    if not game.winners then
        for name in next, GET.room.playerList do 
            TFM.freezePlayer(name)
        end
    end
    for admin in next, game.admins do
        TFM.setNameColor(admin,0xFF7445)
    end
end

function eventNewPlayer(name)
    player[name] = {jump = nil, fasting = nil, langue = GET.room.community}
    TFM.chatMessage(translate("welcomeMessage", name), name)
    TFM.addImage("17538250767.png","&0",0,20,name)
    if not game.started then
        TFM.respawnPlayer(name)
        if not game.winners then
            TFM.freezePlayer(name)
        end
    end
    for _,key in pairs(game.keys) do
        TFM.bindKeyboard(name, key, true, true)
    end
end

function eventPlayerWon(name)
    if not game.winners then
        game.winners = true
        game.started = false
        TFM.chatMessage(string.format(translate("winner", name), name))
        TFM.newGame([[<C><P DS="m;552,367,69,365,235,367,690,365,407,365" Ca="" MEDATA=";;;;-0;0:::1-"/><Z><S><S T="0" X="0" Y="2" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="5,5,175382fb798.png"/><S T="14" X="402" Y="416" L="805" H="68" P="0,0,1,0,0,0,0,0"/><S T="14" X="-29" Y="217" L="55" H="472" P="0,0,0,0.2,0,0,0,0"/><S T="14" X="827" Y="219" L="55" H="472" P="0,0,0,0.2,0,0,0,0"/></S><D/><O/><L/></Z></C>]])
        TFM.setUIMapName("<b>"..game.name.."</b> <g>|</g> "..string.name(name).." ")
        ui.addTextArea(0,"<font size='19' color='#553448'><p align='center'><b>"..string.name(name),nil,308,280,200,200,0x01,0x01,0,true)
        local mapImage = TFM.addImage("175382ff547.png","&1000",0,0)
        system.newTimer(function()
            system.removeTimer(particle)
            TFM.newGame(game.maps[math.random(#game.maps)])
            TFM.removeImage(mapImage)
            ui.removeTextArea(0)
            ui.removeTextArea(1)        
            game.winners = false
            game.time = 15
        end, 12000, false)
        particle = system.newTimer(function()
            for i = 1,30 do
                TFM.displayParticle(11,math.random(0,800),math.random(0,400))
            end
        end, 1000, true)
        for n in next, GET.room.playerList do 
            TFM.freezePlayer(n, false)
        end
    end
end

function eventKeyboard(n,k)
    if game.started then
        if k == 32 then 
            TFM.movePlayer(n, 0, 0, true, 15, 0, true)
            player[n].fasting = os.time()
        elseif k == 1 then 
            if not player[n].jump or player[n].jump + 1500 < os.time() then
                TFM.movePlayer(n,0,0,true,0,-70,false)
                player[n].jump = os.time()
            end
        end
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


function eventLoop()
    game.time = game.time - 0.5
    for i = 1 , 10 do
        if game.time == i then
            ui.addTextArea(0,"<font size='100' color='#010101'><p align='center'><b>"..game.time,nil,310,150,200,200,0x01,0x01,0,true)
            ui.addTextArea(1,"<font size='100'><p align='center'><b>"..game.time,nil,300,150,200,200,0x01,0x01,0,true)
        end
    end
    if game.time == 0 then
        ui.addTextArea(0,"<font size='100' color='#010101'><p align='center'><b>Go!",nil,310,150,200,200,0x01,0x01,0,true)
        ui.addTextArea(1,"<font size='100'><p align='center'><b>Go!",nil,300,150,200,200,0x01,0x01,0,true)
        if not timer then
            local obj = TFM.addShamanObject(2, math.random(3900,3970), math.random(300,350),0,math.random(-50,-30),0,false)
            TFM.addImage(game.objects[math.random(#game.objects)],"#"..obj,-30,-60)
            system.newTimer(function()
                TFM.removeObject(obj)
            end, 3500, false)
            timer = system.newTimer(function()
                local obj = TFM.addShamanObject(2, math.random(3900,3970), math.random(300,350),0,math.random(-50,-30),0,false)
                TFM.addImage(game.objects[math.random(#game.objects)],"#"..obj,-30,-60)
                system.newTimer(function()
                    TFM.removeObject(obj)
                end, math.random(3500,4500), false)
            end, math.random(1500,2500), true)
        end    
        game.started = true
    elseif game.time == -1 then
        ui.removeTextArea(0)
        ui.removeTextArea(1)
    end
end

function main()
    for name in pairs(tfm.get.room.playerList) do
		eventNewPlayer(name)
    end
    for _,cmd in pairs (game.commands) do
        system.disableChatCommandDisplay(cmd)
    end
end

main()
