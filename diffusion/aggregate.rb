@h = 100
@x,@y,@z = [0,0,@h]
@b = 5

@form = []
@tree = []

def nom
  rand-rand
end

def step
  if rand() < 0.6
    @x += nom
    @y += nom
  else
    @z -= rand
  end
end

def walk
  @x,@y,@z = [@b*nom,@b*nom,@h]
  while true
    step
    if (hit = bump)
      return hit 
    end
    return false if @z < 1
  end
end

def bump
  @form.each do |x,y,z|
    return [x,y,z] if (@x-x).abs < 1 && (@y-y).abs < 1 && (@z-z).abs < 1
  end
  false
end

def sim
  3000.times do
    from = walk
    if from
      if stiff from
        @form << (to = [@x,@y,@z])
        @tree << [from, to]
      end
    else
      if based
        @form << [@x,@y,@z]
      end
    end
    break if @z > @h/2
  end
end

def stiff from
  dx = (@x - from[0]).abs
  dy = (@y - from[1]).abs
  dz = @z - from[2]
  dz > [dx,dy].max
end

def based
  @x.abs < @b-1 && @y.abs < @b-1
end

def print
  puts "scale(4) {"
  @tree.each do |e|
    puts hull e[0], e[1]
  end
  puts base
  puts "}"
end

def cube p
  q = (50-p[2])/50
  s = q*1.5+(1-q)*0.5
  "translate(#{p.inspect})cube(#{s},true);"
end

def hull p, q
  "hull() {#{cube p} #{cube q}}"
end

def base
  "cube([#{2*@b},#{2*@b},1],true);"
end

sim
print
