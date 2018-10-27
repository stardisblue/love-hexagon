Class = require 'hump.class'

local Base = Class{
  update = function (self, dt)
    self.time = self.time + dt
    self.progress = self:updateProgress()

    if self.time > self.duration then
      self.progress = self:goal()
      self.update = function () return end-- disabling update
    end
  end
}

function Base:init(duration)
  self.duration = duration or 0

  self.progress = 0
  self.time = 0
end

function Base:updateProgress()
  return self.time / self.duration
end

function Base:goal()
  return 1
end

function Base:draw (x, y)
  return "TODO"
end

return Base
