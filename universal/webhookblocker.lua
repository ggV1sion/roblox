-- This webhook blocker is weak
_G.AntiWebhook_Settings = {
    Delete_Webhook = false
}

local request = http_request or request or HttpPost or syn.request or http.request;
local a;
a = hookfunction(request, function(b)
    if string.find(tostring(string.lower(b.Url)), 'webhooks') or string.find(tostring(string.lower(b.Url), 'websec')) then
        rconsolewarn('A webhook just got blocked: ' .. b.Url)
        if _G.AntiWebhook_Settings.Delete_Webhook then
            rconsolewarn('Webhook deleted.')
            b.Method = 'DELETE'
            return a(b)
        else
            return a
        end
    end
    return a(b)
end)
