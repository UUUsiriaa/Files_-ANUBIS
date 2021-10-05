local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local SIRI = DevSIRI:get("DraGoN:Photo"..result.id_)
if not result.profile_photo_ then 
if SIRI then 
Dev_SIRI(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevSIRI:del("DraGoN:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if SIRI and SIRI ~= result.profile_photo_.big_.persistent_id_ then 
local SIRI_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
SIRI3 = math.random(#SIRI_text)
Dev_SIRI(msg.chat_id_, msg.id_, 1, SIRI_text[SIRI3], 1, 'html')
end  
DevSIRI:set("DraGoN:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
ANUBIS = ChangePhoto
}