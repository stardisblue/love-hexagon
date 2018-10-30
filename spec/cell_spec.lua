local Cell = require 'map.cell'


describe('Cell', function ()
  it('sets the coordinates normally', function()
    local cell = Cell(0, 0, 0)
    assert.is_true(cell == {0, 0, 0})
    assert.is_true(Cell(1, 2, -3) == Cell(1, 2))
  end)
  
  
end)
