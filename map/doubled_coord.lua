local Cell = require 'map.cell'
local DoubledCoord = {}

function DoubledCoord.qFromCube (cell)
  return {cell[1],
          2 * cell[2] + cell[1]}
end

function DoubledCoord.qToCube (coord)
  return Cell(coord.col,
              math.floor((coord.row - coord.col) / 2))
end

function DoubledCoord.rFromCube (cell)
  return {2 * cell[1] + cell[2],
          cell[2]}
end

function DoubledCoord.rToCube (coord)
  return Cell(math.floor((coord.col - coord.row) / 2),
              coord.row)
end

return DoubledCoord
