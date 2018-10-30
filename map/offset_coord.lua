local Class = require 'hump.class'
local Cell = require 'map.cell'
local OffsetCoord = Class{}

function OffsetCoord:init(col, row)
  self.col = col
  self.row = row
end

function OffsetCoord.qFromCube(offset, cell)
  return OffsetCoord(cell[1],
                     cell[2] + math.floor((cell[1] + offset * (cell[1] & 1) ) / 2))
end

function OffsetCoord.qToCube(offset, coord)
  return Cell(coord.col,
              coord.row - math.floor((coord.col + offset * (coord.col & 1)) / 2))
end

function OffsetCoord.rFromCube(offset, cell)
  return OffsetCoord(cell[1] + math.floor((cell[2] + offset * (cell[2] & 1)) / 2),
                     cell[2])
end

function OffsetCoord.rToCube(offset, coord)
  return Cell(coord.col - math.floor((coord.row + offset * (coord.row & 1)) / 2),
              coord.row)
end

return OffsetCoord
