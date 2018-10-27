local Utils = {}

function Utils.rotate(x, y, angle)
      love.graphics.translate(x, y)
      love.graphics.rotate(angle)
      love.graphics.translate(-x,-y)
end

function Utils.scope(scopetype, funct, ...)
  love.graphics.push(scopetype)
  funct(...)
  love.graphics.pop()
end

function Utils.map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v, i)
  end
  return new_array
end

return Utils
