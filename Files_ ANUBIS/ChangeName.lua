local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local SIRI = DevSIRI:get("DraGoN:Name"..result.id_)
if not result.first_name_ then 
if SIRI then 
DevSIRI:del("DraGoN:Name"..result.id_) 
end
end
if result.first_name_ then 
if SIRI and SIRI ~= result.first_name_ then 
local SIRI_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
SIRIs = math.random(#SIRI_text)
Dev_SIRI(msg.chat_id_, msg.id_, 1, SIRI_text[SIRIs], 1, 'html')
end  
DevSIRI:set("DraGoN:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
ANUBIS = ChangeName
}