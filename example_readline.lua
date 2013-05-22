#!/usr/bin/env lua
--[[
Readline.lua
Lua examplar use of the readline function
]]

local prompt = '>> '

local rl, readline, saveline
local err = pcall(function()
    rl = require 'readline'
    readline = rl.readline
    saveline = rl.add_history
end)

if not rl then
    function readline (prompt)
        io.write (prompt)
        return io.read()
    end
    saveline = function(s) end
end

while true do
    local input = readline(prompt)

    if input ~= '' and input ~= nil then
        saveline (input)
    else
        break
    end
end