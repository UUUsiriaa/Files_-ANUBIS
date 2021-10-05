local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_SIRI(msg.chat_id_,msg.id_, 1, "⌯︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌯︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevSIRI:del(ANUBIS.."SIRI:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_SIRI(msg.chat_id_,msg.id_, 1, "⌯︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevSIRI:set(ANUBIS.."SIRI:Lock:AutoFile",true) 
end 
end

if (text and not DevSIRI:get(ANUBIS.."SIRI:Lock:AutoFile")) then
Time = DevSIRI:get(ANUBIS.."SIRI:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevSIRI:smembers(ANUBIS..'SIRI:Groups') 
local Members = DevSIRI:smembers(ANUBIS..'SIRI:Users') 
local BotName = (DevSIRI:get(ANUBIS.."SIRI:NameBot") or 'دراكون')
local GetJson = '{"BotId": '..ANUBIS..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevSIRI:get(ANUBIS.."SIRI:Groups:Links"..v)
Welcomes = DevSIRI:get(ANUBIS..'SIRI:Groups:Welcomes'..v) or ''
SIRIConstructors = DevSIRI:smembers(ANUBIS..'SIRI:SIRIConstructor:'..v)
BasicConstructors = DevSIRI:smembers(ANUBIS..'SIRI:BasicConstructor:'..v)
Constructors = DevSIRI:smembers(ANUBIS..'SIRI:Constructor:'..v)
Managers = DevSIRI:smembers(ANUBIS..'SIRI:Managers:'..v)
Admis = DevSIRI:smembers(ANUBIS..'SIRI:Admins:'..v)
Vips = DevSIRI:smembers(ANUBIS..'SIRI:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #SIRIConstructors ~= 0 then
GetJson = GetJson..'"SIRIConstructors":['
for k,v in pairs(SIRIConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
if #Members ~= 0 then 
GetJson = GetJson..',"mem":['
for k,v in pairs(Members) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
GetJson = GetJson..'}}'
local File = io.open('./'..ANUBIS..'.json', "w")
File:write(GetJson)
File:close()
local SIRI = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. SIRI .. '" -F "chat_id='..⁦DevId..'" -F "document=@'..ANUBIS..'.json' .. '" -F "caption=⌯︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه\n⌯︙وتحتوي ايضاَ علئ ↫ '..#Members..' مشتركين\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"'
io.popen(curl)
io.popen('fm -fr '..ANUBIS..'.json')
DevSIRI:set(ANUBIS.."SIRI:AutoFile:Time",os.date("%x"))
end
else 
DevSIRI:set(ANUBIS.."SIRI:AutoFile:Time",os.date("%x"))
end
end

end
return {
ANUBIS = AutoFile
}
