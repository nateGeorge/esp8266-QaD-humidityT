pin = 1

-- read and publish humidity every 5 minutes
tmr.alarm(5, 5*60*1000, 1, function()
    status,temp,humi,temp_decimial,humi_decimial = dht.read(pin)
    if( status == dht.OK ) then
        sendToTS = require("sendToTS")
        sendToTS.setKey('API-WRITE-KEY')
        sendToTS.setValue(1,humi)
        sendToTS.setValue(2,temp)
        sendToTS.sendData(true)
        print('sending')
        sendToTS = nil
        package.loaded["sendToTS"]=nil
        collectgarbage()
    end
end)
