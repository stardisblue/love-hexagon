local Class = require 'hump.class'

local Cell = Class{}

function Cell:init(q, r, s)
  self[1] = q
  self[2] = r
  self[3] = s or - q - r
  assert( self:q() + self:r() + self:s() == 0)
end

function Cell:q ()
  return self[1]
end

function Cell:r ()
  return self[2]
end

function Cell:s ()
  return self[3]
end

function Cell.__eq (a, b)
  return a[1] == b[1] and a[2] == b[2] and a[3] == b[3]
end


function Cell.__add (a, b)
  return Cell(a[1] + b[1], a[2] + b[2], a[3] + b[3])
end

function Cell.__sub (a, b)
  return Cell(a[1] - b[1], a[2] - b[2], a[3] - b[3])
end

function Cell.__mul (a, k)
  return Cell(a[1] * k, a[2] * k, a[3] * k)
end

function Cell.__len (a)
  return (math.abs(a[1]) + math.abs(a[2]) + math.abs(a[3]))/2
end

function Cell.distance(a, b)
  return #(a - b)
end


function Cell:rotateLeft()
  return Cell(-self[3], -self[1])
end

function Cell:rotateRight()
  return Cell(-self[2], -self[3])
end

local cellDirections = {{1, 0, -1}, {1, -1, 0}, {0, -1, 1}, {-1, 0, 1}, {-1, 1, 0}, {0, 1, -1}}

function Cell:neighbor(direction)
  return self + cellDirections[direction]
end

local cellDiagonal = {{2, -1, -1}, {1, -2, 1}, {-1, -1, 2}, {-2, 1, 1}, {-1, 2, -1}, {1, 1, -2}}

function Cell:diagonal(direction)
  return self + cellDiagonal[direction]
end

--- Lerp interpolation
-- @param a Cell
-- @param b Cell
-- @param time number
function Cell.lerp(a, b, time)
  return (a * (1.0 - time)) + (b * time)
end

function Cell:round()
  local qi, ri, si = math.floor(self[1] + .5), math.floor(self[2] + .5), math.floor(self[3] + .5)
  local qDiff, rDiff, sDiff = math.abs(qi - self[1]), math.abs(ri - self[2]), math.abs(si - self[3])

  if qDiff > rDiff and qDiff > sDiff then
    qi = -ri - si
  elseif rDiff > sDiff then
    ri = -qi - si
  end

  return Cell(qi, ri)
end

function Cell.linedraw(a, b)
  local n = Cell.distance(a, b)
  local aNudge= Cell(a[1] + 0.000001, a[2] + 0.000001)
  local bNudge= Cell(b[1] + 0.000001, b[2] + 0.000001)

  local results = {}
  local step = 1.0 / math.max(n, 1)

  for i = 0, n do
    table.insert(results, Cell.lerp(aNudge, bNudge, step * i):round())
  end

  return results
end

return Cell
