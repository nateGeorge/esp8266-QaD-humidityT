tmr.alarm(1, 1000, 1, function()
    if wifi.sta.status() == 5 then
        tmr.stop(1)
        print('running file')
        dofile('measuHmdty.lua')
    elseif wifi.sta.status() == 1 then
        print('connecting')
    else
        node.restart()
    end
end)
