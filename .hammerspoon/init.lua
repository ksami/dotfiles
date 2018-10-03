hs.urlevent.bind("karabiner", function(eventName, params)
  if params["pause"] then
    app = hs.application.find("waterfox")
    app:activate()
    hs.eventtap.keyStroke({"alt", "shift"}, "p")
  end
end)
