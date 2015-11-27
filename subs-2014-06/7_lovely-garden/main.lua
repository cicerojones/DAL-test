function love.load()

  math.randomseed(os.time())
  
  turns = 0
  tile_size = 32

  width, height = love.window.getDimensions()
  window_tile_width = width / tile_size
  window_tile_height = height / tile_size

  selector = love.graphics.newImage("assets/selector.png")
  selector_x = 4
  selector_y = 4

  -- bugs
  bug = love.graphics.newImage("assets/bug.png")

  -- element tile types
  soil = love.graphics.newImage("assets/bg0.png")
  grass = love.graphics.newImage("assets/bg1.png")
  concrete = love.graphics.newImage("assets/bg2.png")
  cracked = love.graphics.newImage("assets/bg3.png")
  water = love.graphics.newImage("assets/bg4.png")
  seed = love.graphics.newImage("assets/seed_soil.png")
  flower = love.graphics.newImage("assets/flower.png")
  flower_sad = love.graphics.newImage("assets/flower-sad.png")

  -- map (0-indexed):
  --        0     1       2         3       4       5     6       7
  -- tiles (1-indexed):
  --        1     2       3         4       5       6     7       8
  tiles = {soil, grass, concrete, cracked, water, seed, flower, flower_sad}

  map =
  {{2,2,2,0,0,0,0,0,0,0,0,0,2,2,2},
   {2,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
   {0,0,0,0,4,4,4,0,0,0,0,0,0,0,0},
   {0,3,3,0,4,4,4,3,3,3,3,3,3,0,0},
   {2,3,3,0,0,0,3,3,3,3,3,3,3,3,2},
   {2,0,0,0,0,0,3,3,3,3,3,1,1,1,2},
   {2,0,0,0,0,0,3,3,3,3,3,1,1,1,2},
   {2,0,0,0,0,0,0,0,0,0,0,1,1,1,2},
   {2,0,0,0,0,0,0,0,0,0,0,1,1,1,2},
   {2,0,0,0,0,0,0,0,0,0,0,1,1,1,2},
   {2,2,2,1,1,1,0,0,0,0,0,0,0,2,2}
  }
  max_x = min(window_tile_width, #map[1])
  max_y = min(window_tile_height, #map)


  bugs = {}
  for y=1,max_y do
    for x=1,max_x do
      if bugs[y] then bugs[y][x] = false
      else bugs[y] = {false}
      end
    end
  end

  -- sound
  song1 = love.audio.newSource("assets/in-lieu.wav", stream)
  song1:setLooping(true)
  love.audio.play(song1)
end

function draw_bugs()
  for y=1, max_y do
    for x=1, max_x do
      if bugs[y][x] then draw_at_tile(bug, x, y)
      end
    end
  end
end

function draw_bg()
 for y=1,max_y do
   for x=1,min(max_x,#map[y]) do
     index = map[y][x] + 1 
     if index > 12 then index = 7
     else if index > #tiles or index == 7 then index = 8
     end end
     -- index = min(#tiles, map[y][x] + 1)
     draw_at_tile(tiles[index], x, y)
   end
 end
end

function draw_tilepicker()
  for i=1,#tiles do
    love.graphics.draw(tiles[i], 600, 20 + tile_size*i)
    love.graphics.print(""..i, 600, 20 + tile_size*i)
  end
end

function draw_at_tile(image, x, y)
  love.graphics.draw(image, (x-1)*tile_size, (y-1)*tile_size)
end

function love.draw()

    draw_bg()
    draw_tilepicker()
    draw_bugs()

    draw_at_tile(selector, selector_x, selector_y)

    instructions =
    "Controls:\n\
    r:      restart\n\
    b:      add a bug =:)\n\
    4,5,6:  apply tile"
    love.graphics.print(instructions, 0,400)

end

function max(x,y)
  if x < y then return y else return x
  end
end

function min(x, y)
  if x < y then return x else return y
  end
end

function adjs(x,y)
  adjacents = {}
  if x > 1 then
    adjacents[#adjacents+1] = {x-1,y}
  end
  if y > 1 then
    adjacents[#adjacents+1] = {x,y-1}
  end
  if x < max_x then
    adjacents[#adjacents+1] = {x+1,y}
  end
  if y < max_y then
    adjacents[#adjacents+1] = {x,y+1}
  end
  return adjacents
end

-- function love.update(dt)
-- end

function can_move_to(x, y)
  if map[y] == nil then return false end
  if map[y][x] == nil then return false end
  -- if map[y][x] == 2 then return false end
  return true
end

function contains(array, value)
  answer = false
  for i=1,#array do
    if array[i] == value then
      answer = true
    end
  end
  return answer
end

function update_autonomous_tile(x, y)
  
  -- grass to flower
  if map[y][x] == 1 and math.random(10) == 5 and not bugs[y][x] then 
    map[y][x] = 21 
  else
  -- grass gets bug
  -- if map[y][x] == 1 and math.random(40) == 1 then
    -- -- add a bug
    -- bugs[y][x] = true
  -- else
  -- sad flower to cracked
  if map[y][x] == 6 then map[y][x] = 3 else
  -- healthy flower to flower--
  if map[y][x] > 6 then 
    if bugs[y][x] then -- bug eats flower
      map[y][x] = 1
    else
      map[y][x] = map[y][x] - 1 
    end
  else
  if map[y][x] == 0 and math.random(100) == 1 then 
    -- map[y][x] = 1
  end end end end -- end

  -- bug movement
  if bugs[y][x] then
    adjacents = adjs(x,y)
    if #adjacents > 0 then
    --  love.graphics.print("hellooooo", 0, 430+x)
      newxy = adjacents[math.random(#adjacents)]
      newx = newxy[1]
      newy = newxy[2]
      if map[newy][newx] == 1 or map[newy][newx] >= 6 then
        bugs[y][x] = false
        bugs[newxy[2]][newxy[1]] = true
      end
    end
  end -- bug movement

end

function update_tile(x, y, element)
  if map[y][x] == 0 then
  -- soil to seed
    if element == 5 then map[y][x] = 5 end
  -- soil to water
    if element == 4 then map[y][x] = 4 end
  end
  --if map[y][x] == 1 then
  --  if element == 4 then map[y][x] = 6 end
  --end
  -- water + cracked => soil
  if map[y][x] == 3 then
    if element == 4 then map[y][x] = 0 end
    if element == 2 then map[y][x] = 2 end
  end
  -- cracked + water => soil
  if map[y][x] == 4 then
    if element == 3 then map[y][x] = 0 end
  end
  -- seed + water => grass
   if map[y][x] == 5 then
    if element == 4 then map[y][x] = 1 end
   end
  -- water + flower => flower++
  if map[y][x] >= 6 then
    map[y][x] = map[y][x] + 10
  end
end

function love.keypressed(key)
  turns = turns + 1

    for x=1,max_x do
      for y=1,max_y do
        update_autonomous_tile(x,y)
      end
    end


  oldx = selector_x
  oldy = selector_y
  if key == "up" then
    selector_y = max(selector_y - 1, 0)
  else if key == "down" then
    selector_y = min(selector_y + 1, max_y)
  else if key == "right" then
    selector_x = min(selector_x + 1, max_x)
  else if key == "left" then
    selector_x = max(selector_x - 1, 0)
--   else if key == "1" then
--     update_tile(selector_x, selector_y, 0)
--   else if key == "2" then
--     update_tile(selector_x, selector_y, 1)
--   else if key == "3" then
--     update_tile(selector_x, selector_y, 2)
--   else if key == "4" then
--     update_tile(selector_x, selector_y, 3)
--   else if key == "5" then
--     update_tile(selector_x, selector_y, 4)
--   else if key == "6" then
--     update_tile(selector_x, selector_y, 5)
--   end end end end end end 
  else if key == "b" then
    bugs[selector_y][selector_x] = true
  else if key == "r" then
    love.load()
  else if not (tonumber(key) == nil) then
    update_tile(selector_x, selector_y, tonumber(key) - 1)
  end end end end end end end

  if not can_move_to(selector_x, selector_y) then
    selector_x = oldx
    selector_y = oldy
  end
end


