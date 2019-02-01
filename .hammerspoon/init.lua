function chrome_click_button_on_tab_with_host(host, playBtnSelector)
    hs.osascript.javascript([[
        // below is javascript code
        var chrome = Application('Google Chrome');
        // chrome.activate();
        var wins = chrome.windows;

        // loop tabs to find a web page with a url from <host>
        function main() {
          for (var i = 0; i < wins.length; i++) {
            var win = wins.at(i);
            var tabs = win.tabs;
            for (var j = 0; j < tabs.length; j++) {
              var tab = tabs.at(j);
              tab.url(); j;
              if (tab.url().indexOf(']] .. host .. [[') > -1) {
                // win.activeTabIndex = j + 1;
                tab.execute({
                  javascript: "document.querySelector(']] .. playBtnSelector .. [[').click();"
                })
                return;
              }
            }
          }
        }
        main();
        // end of javascript
    ]])
end


hs.urlevent.bind("karabiner", function(eventName, params)
  if params["pause"] then
    chrome_click_button_on_tab_with_host("open.spotify.com", ".player-controls__buttons button:nth-child(3)")
    chrome_click_button_on_tab_with_host("soundcloud.com", ".playControl")
    chrome_click_button_on_tab_with_host("youtube.com", ".ytp-play-button")
  elseif params["next"] then
    chrome_click_button_on_tab_with_host("open.spotify.com", ".player-controls__buttons button:nth-child(4)")
    chrome_click_button_on_tab_with_host("soundcloud.com", ".skipControl")
    chrome_click_button_on_tab_with_host("youtube.com", ".ytp-next-button")
  end
end)


local workWifi = 'ssid'
local outputDeviceName = 'Built-in Output'
hs.wifi.watcher.new(function()
    local currentWifi = hs.wifi.currentNetwork()
    local currentOutput = hs.audiodevice.current(false)
    if not currentWifi then return end
    if (currentWifi == workWifi and currentOutput.name == outputDeviceName) then
        hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)
    end
end):start()
