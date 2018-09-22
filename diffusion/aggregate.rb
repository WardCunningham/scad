@h = 100
@x,@y,@z = [0,0,@h]
@b = 5
@f = 10000

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
  frame
  3000.times do
    from = walk
    if from
      if stiff from
        @form << (to = [@x,@y,@z])
        @tree << [from, to]
        frame
      end
    else
      if based
        @form << [@x,@y,@z]
        frame
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
  @x.abs < @b-1.5 && @y.abs < @b-1.5
end

def frame
  # File.open("frames/#{@f}.scad",'w') do |io|
  #   emit io
  # end
  @f += 1
end

def emit io
  io.puts "module tree() {"
  @tree.each do |e|
    io.puts hull e[0], e[1]
  end
  io.puts "}"
  io.puts geometery
end

def cube p
  q = (50-p[2])/50
  s = q*1.5+(1-q)*0.5
  "translate(#{p.inspect})rotate([0,0,#{nom*360/12}])sphere(#{s/1.414},true,$fn=12);"
end

def hull p, q
  "hull() {#{cube p} #{cube q}}"
end

def base
  "cube([#{2*@b},#{2*@b},1.2],true);"
end

def geometery
  "difference() {
    scale(4) {
      tree();
      #{base}
    }
    scale(4)
      translate([0,0,-1.2])
        #{base}
    scale(.6)
      translate([-30,25,-3.5])
        #{sig ARGV[0]}
  }"
end

def sig n
  "rotate([180,0,0])
    linear_extrude(height=3,convexity=4)
      minkowski() {
        text(\"##{n} Ward\",font=\"Handwriting \\\\- Dakota\");
        circle(.2,true);
      }
  "
end

puts "need sig number" unless ARGV[0]
sim
emit STDOUT
STDERR.puts @f
