xml=[[<C><P/><Z><S><S L="10" X="-5" H="400" Y="200" T="12" P="0,0,0,0,0,0,0,0"/><S L="10" H="400" X="805" Y="200" T="12" P="0,0,0,0,0,0,0,0"/><S X="100" Y="375" T="12" L="198" H="70" o="DA9624" P="0,0,0.3,0.2,0,0,0,0"/><S X="300" Y="375" T="12" L="198" H="70" o="DA9624" P="0,0,0.3,0.2,0,0,0,0"/><S X="500" Y="375" T="12" L="198" H="70" o="DA9624" P="0,0,0.3,0.2,0,0,0,0"/><S X="700" Y="375" T="12" L="198" H="70" o="DA9624" P="0,0,0.3,0.2,0,0,0,0"/><S X="200" Y="345" T="1" L="20" H="20" P="0,0,0,0.2,-45,0,0,0" m=""/><S X="401" Y="345" T="1" L="20" H="20" P="0,0,0,0.2,-45,0,0,0" m=""/><S X="598" Y="344" T="1" L="20" H="20" P="0,0,0,0.2,-45,0,0,0" m=""/></S><D/><O/><L/></Z></C>]]
Admins={["Noooooooorr#0000"]=true,["Massi#0015"]=true,["Omaraldin#1619"]=true,["Turkitutu#0000"]=true}
currentQuestion=1
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)

system.disableChatCommandDisplay(nil)

questions={
    {
        q="كم عدد اصابع رجل الفأر في ترانسفورمايس",
        a={"3","5","2","0"},
    },
    {
        q="من مصمم الجرافيك للعبة ترانسفورمايس",
        a={"Melibellule","Tigrounette","Zou","Adrazaelle"},
    },
    {
        q="من هو أضعف الحيوانات ذاكرة ؟",
        a={"السمكة","طائر النورس","القرد","البقرة"},
    },
    {
        q=":عاصمة الفلبين",
        a={"مانيلا","أديس بابا","موسكو","نايروبي"},
    },
    {
        q="ما هو أكثر عنصر كيميائي متواجد في جسم الإنسان؟ ",
        a={"الأوكسجين","الحديد","الماء","الهيدروجين"},
    },
    {
        q="من هو أول مبرمج لوا بترانسفورمايس في المجتمع العربيّ ؟",
        a={"Safwanrockz","Turkitutu","Zagear","Bodykudo"},
    },
    {
        q="ماذا يعني اللون البرتقالي للاعبين في الملف الشخصي؟",
        a={"فانكورب","مشرفين","طاقم خرائط","مراقبو منتديات"},
    },
    {
        q="هل لدى أعضاء الفانكورب لون مميز في المنتدى؟",
        a={"لا"," نعم برتقالي","نعم أحمر","غير ذلك"},
    },
    {
        q="كلمة إلخ اختصار لـ",
        a={"إلى آخرهِ","كلمة عيب","إن لعب خرب","لتكبر بقول لك"},
    },
    {
        q="من هو آخر مراقب عربي إنضم للمراقبة؟",
        a={"Elysium#0095","شخص آخر","Ragekitteee#0015","Massi#0015"},
    },
    {
        q="ماهو الإيعاز الذي يجعل فأرك يرفع علم بلادك؟",
        a={"./f","./tk","./inv","./silence"},
    },
    {
        q="كم يمكن ان تمنح ال10 تذكرة ذهبية من الجبنة؟",
        a={"غير ذلك","10","50","100"},
    },
    {
        q="كم عدد المشرفين العرب؟",
        a={"0","3","2","1"},
    },
    {
        q="ما هي لغة النمسا ؟",
        a={"اللغة الألمانية","اللغة النمساوية","اللغة البريطانية","اللغة العربية"},
    },
    {
        q="متى ظهر نظام النجوم (★) في الألقاب ؟",
        a={"2013","2010","2015","2012"},
    },
    {
        q="كم الحد الأقصى للمواضيع التي يمكن مشاهدتها في المقهي ؟",
        a={"20","25","15","10"},
    },
        {
        q="ما هو الحيوان الذي لا يمتلك هيكلاً عظمياً على الإطلاق؟",
        a={"قنديل البحر","الأفعى","القطة","الاسماك"},
    },
    {
        q="كم عدد أرجل الأخطبوط ؟",
        a={"8","12","4","6"},
    },
    {
        q="يأكل و لا يشبع و عندما يشرب يموت من هو؟",
        a={"النار","الماء","التربة","النبات"},
    },
    {
        q=":من طرق الوقاية من فيروس كورونا",
        a={"غسل اليدين","التقبيل","الذهاب للأماكن المزدحمة","السفر للصين"},
    },
    {
        q="ما هو ناتج العملية الحسابية (1+2)2÷6؟",
        a={"9","12","16","6"},
    },
    {
        q="ما هو ناتج العملية الحسابية (6*5)+(2÷10)؟",
        a={"35","42.5","65","52"},
    },
    {
        q="ما هي أول لعبة تم وضعها في هذا الحفل؟",
        a={"الأرض أصبحت حمم بركانية","حرب النقر","القرية المجنونة","بطاطا"},
    },
    {
        q="؟Noooooooorr#0000 من هي المغنية الموجودة في صورة ملف",
        a={"أريانا غراندي","سيلينا غومز","دوا ليبا","أديل"},
    },
}

start = false

function table.shuffle(t)
    local t = t
    local n = #t
    local j
    for i = 1, n do
        j = math.random(i)
        t[j],t[i] = t[i],t[j]
    end
    return t
end
table.shuffle(questions)

function eventChatCommand(n,c)
    local args={}
    for s in c:gmatch("%S+") do
        table.insert(args, s)
    end
    if Admins[n] then
        if c:sub(0,2)=="ms" then
            tfm.exec.chatMessage("<font color='#D89422'>[فريق المساعدين العربي]</font>\n<font color='#A2CCFF'>"..c:sub(3).."</font>")
        elseif c:sub(0,1)=="c" then
            tfm.exec.chatMessage("<font color='#D89422'>["..n.."]</font>\n<font color='#A2CCFF'>"..c:a(2))
        elseif args[1]=="st" then
            currentQuestion = tonumber(args[2])
        elseif c == "killall" then
            for n in pairs(tfm.get.room.playerList) do
                tfm.exec.killPlayer(n)
            end
        elseif args[1] == "rv" then
            tfm.exec.respawnPlayer(args[2])
        elseif c == "start" then
            tfm.exec.chatMessage("<font size='666'><r>لقد تم حذف الشات</r>")
            displayQuestion(currentQuestion)
            start = true
        elseif c == "rc" then
            tfm.exec.chatMessage("<font size='12'><vp>لقد عاد الشات</vp>")
        end
    end
end

function displayQuestion(num)
    ui.addTextArea(1,"<p align='center'><font size='22'><font color='#D89422'><b>"..questions[num].q.."</font></p>",nil,00,30,800,nil,0x324650,0x212F36,0,true)
      correctAnswer=questions[num].a[1]
      shuffledAnswers = table.shuffle(questions[num].a)
    for k,v in ipairs(shuffledAnswers) do
        ui.addTextArea(1+k,"<font color='#2b291d'><p align='center'><font size='18'><b>"..v.."</font></p>",nil,(k-1)*200,350,200,nil,0x324650,0x212F36,0,true)
    end
    tfm.exec.setGameTime(14)
end

function eventPopupAnswer(id,n,a)
    local fc = a:gsub("<", "&lt;")
    tfm.exec.chatMessage("<J>"..fc.." <BV>["..n.."]")
    ui.addPopup(id, 2, "Enter text", n, 0, 350, 300, true)
end
 
function eventLoop(time, remaining)
      if remaining<=0 and start then
        tfm.exec.chatMessage("<font size='666'><r>لقد تم حذف الشات</r>")
        if questions[currentQuestion] then
            for k,v in ipairs(shuffledAnswers) do
                if v==correctAnswer then
                    correctAnswer=k
                end
            end
            for name,player in pairs(tfm.get.room.playerList) do
                if (not player.isDead) and not (player.x<correctAnswer*200 and player.x>(correctAnswer*200)-200) then
                    tfm.exec.killPlayer(name)
                end
            end
            currentQuestion=currentQuestion+1
            if questions[currentQuestion] then
                start=true
                 displayQuestion(currentQuestion)
            else
                start=false
            end
          end
    end
end

function eventPlayerDied(name)
    local i=0
    local n
    for pname,player in pairs(tfm.get.room.playerList) do
        if not player.isDead then
            i=i+1
            n=pname
        end
    end
    if i==0 then
        ui.addTextArea(1,"<p align='center'><font size='22'><r><b>لم يفٌز أحد</b></r></font></p>",nil,00,30,800,nil,0x324650,0x212F36,0,true)
    elseif i==1 then
        start = false
        tfm.exec.chatMessage("<font size='12'><vp>لقد عاد الشات</vp>")
        for i=1,5 do ui.removeTextArea(i) end
        for n, p in next, tfm.get.room.playerList do
            if not p.isDead then
                ui.addTextArea(1,"<p align='center'><font size='22'><font color='#E4AD52'><b>!بالجولة "..n.." فاز</b></font></p>",nil,00,30,800,nil,0x324650,0x212F36,0,true)
                for k in next, Admins do
                    tfm.exec.chatMessage("<font size='12'>/trade "..n, k)
                end
            end
        end
	end
end

function eventNewGame()
    start = false
    tfm.exec.addImage("1730b26e964.png", "_0", 0, 0, nil)
    tfm.exec.setUIMapName("<font color='#FFBD50'>!مسابقة الأسئلة")
    tfm.exec.chatMessage("<p align='center'><font color='#FFBD50'><B>!مرحبًا بكم في مسابقة الأسئلة</B>\n<font color='#DC8D3C'>يجب عليكم قراءة السؤال و الوقوف على الجواب الصحيح\n !!!قبل إنتهاء الوقت المحدد</p></font><p align='right'>",nil)
    table.shuffle(questions)
    for n in pairs(tfm.get.room.playerList) do
        if Admins[n] then
            tfm.exec.setNameColor(n, 0xF0173A)
        end
    end
end
tfm.exec.newGame(xml)
tfm.exec.addImage("1730b26e964.png", "_0", 0, 0, nil)