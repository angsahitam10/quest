-- PID = gQarrfPipAhDVzjYbCgrQj3tFv5yqkBt9reNMT_HwgQ

_ORBIT = "WSXUI2JjYUldJ7CKq9wE1MGwXs-ldzlUlHOQszwQe0s"

function handleError(msg, errorMessage)
ao.send({
    Target = msg.From,
    Tags = {
        Action = "Error",
        ["Message-id"] = msg.Id,
        Error = errorMessage
    }
})
end

Handlers.add("angsahitam10",
Handlers.utils.hasMatchingTag("Action", "angsa-hitam10"),
function(msg)
local token = msg.Tags.Token
local url = "https://api.coingecko.com/api/v3/simple/price" .. "?ids=" .. token .. "&vs_currencies=usd"
ao.send({
    Target = _ORBIT,
    Action = "Get-Real-Data",
    Url = url
})
Handlers.utils.reply("PriceFetch")
(msg)
end
)