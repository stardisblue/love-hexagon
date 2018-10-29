Class = require 'hump.class'

Cell = Class{}

function Cell:init(q, r, s)
  self.v[1] = q
  self.v[2] = r
  self.v[3] = s or - q_ - r_
  assert( self.q() + self.r() + self.s() == 0)
end

function Cell:q ()
  return self.v[1]
end

function Cell:r ()
  return self.v[2]
end

function Cell:s ()
  return self.v[3]
end

function Cell.__eq (a, b)
  return a.v[1] == b.v[1] and a.v[2] == b.v[2] and a.v[3] == b.v[3]
end


function Cell.__add (a, b)
  return Hex(a.v[1] + b.v[1], a.v[2] + b.v[2], a.v[3] + b.v[3])
end

function Cell.__sub (a, b)
  return Hex(a.v[1] - b.v[1], a.v[2] - b.v[2], a.v[3] - b.v[3])
end

function Cell.__mul (a, k)
  return Hex(a.v[1] * k, a.v[2] * k, a.v[3] * k)
end

function Cell:length()
  return (math.abs(hex.v[1]) + math.abs(hex.v[2]) + math.abs(hex.v[3]))/2
end

function Cell.distance(a, b)
  return (a - b):length()
end
