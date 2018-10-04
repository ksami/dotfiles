hs.urlevent.bind("karabiner", function(eventName, params)
  app = hs.application.find("waterfox")
  app:activate()
  if params["pause"] then
    -- hs.alert.show("pause")
    hs.eventtap.keyStroke({"alt", "shift"}, "p")
  elseif params["next"] then
    -- hs.alert.show("next")
    hs.eventtap.keyStroke({"alt", "shift"}, "right")
  end
end)
