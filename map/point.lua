local Class = require 'hump.class'

local Point = Class{
  init = function (self, x, y)
    self[1], self[2] = x, y
  end
}

function Point:x ()
  return self[1]
end

function Point:y ()
  return self[1]
end

return Point
