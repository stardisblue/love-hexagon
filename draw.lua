local Draw = {
  update = function (self, dt)
    self.time = self.time + dt
    self.progress = self:updateProgress()

    if self.time > self.duration then
      self.progress = self:goal()
      self.update = nil -- disabling update
    end
  end
}
Draw.__index = Draw

function Draw:updateProgress()
  return self.time / self.duration
end

function Draw:goal()
  return 1
end

function Draw:newDraw(duration, direction, scoped)
  local dr = {}

  dr.angle = direction
  dr.duration = duration or 0
  dr.scoped = scoped and true

  dr.progress = 0
  dr.time = 0

  return dr
end

function Draw.rotate(x, y, angle)
  love.graphics.translate(x, y)
  love.graphics.rotate(angle)
  love.graphics.translate(-x,-y)
end

return Draw
