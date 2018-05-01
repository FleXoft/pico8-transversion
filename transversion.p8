pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--
-- ______________________________________     _______________________________________
-- ________                            \ |   / /
-- ___  __/____________ _______________\ |  / /_____________________(_)_____________
-- __  /  __  ___/  __ `/_  __ \_  ___/_ | / /_  _ \_  ___/_  ___/_  /_  __ \_  __ \
-- _  /   _  /   / /_/ /_  / / /(__  )__ |/ / /  __/  /   _(__  )_  / / /_/ /  / / /
-- /_/    /_/    \__,_/ /_/ /_//____/ _____/  \___//_/    /____/ /_/  \____//_/ /_/
-- 
-- transversion clone / remake
-- v1.0 (beta)
-- by _flex from flexoft
-- 2018.
-- 

-- global variables
local t = 0 -- global time

local score     = 0
local highscore = 0
local lives     = 4
local level     = 1  

-- grid parameters
local gridx          = 6
local gridy          = 14
local gridxnums      = 23
local gridynums      = 20
local gridpixelsteps = 5

-- player's spaceship 
local spaceship 
-- cannons
local leftcannon
local rightcannon
local uppercannon
local lowercannon

-- bullets
local leftbullet
local rightbullet
local upperbullet
local lowerbullet

function game_reset()

 score     = 0
 lives     = 4
 level     = 1  

end

function game_init()

	spaceship = { x = flr ( gridxnums / 2 ) + 1, y = flr ( gridynums / 2 ), movement = 0 }

	-- cannons
	leftcannon  = { position = 2,             direction = 1,  lastdirection = 0 }
	rightcannon = { position = gridynums - 2, direction = -1, lastdirection = 0 }
	uppercannon = { position = 2,             direction = 1,  lastdirection = 0 }
	lowercannon = { position = gridxnums - 2, direction = -1, lastdirection = 0 }

	-- bullets
	leftbullet  = { position = -1 }
	rightbullet = { position = -1 }
	upperbullet = { position = -1 }
	lowerbullet = { position = -1 }

end

local levels = {}

add( levels, { point = 1,  sprite = 16 } ) -- 1
add( levels, { point = 50, sprite = 17 } ) -- 2
add( levels, { point = 3,  sprite = 18 } ) -- 3
add( levels, { point = 50, sprite = 17 } ) -- 4
add( levels, { point = 7,  sprite = 19 } ) -- 5
add( levels, { point = 50, sprite = 17 } ) -- 6
add( levels, { point = 9,  sprite = 20 } ) -- 7
add( levels, { point = 50, sprite = 17 } ) -- 8

-- 
local treasures = {}

function tt( tx, ty )
		add( treasures, { x = tx, y = ty } )
end

-- level 1
function level1 ()  

 tt( 2, 6 )
 tt( 2, 7 )
 tt( 3, 5 )
 tt( 3, 7 )
 tt( 4, 4 )
 tt( 4, 7 )
 tt( 5, 3 )
 tt( 5, 7 )
 tt( 6, 3 )
 tt( 6, 4 )
 tt( 6, 5 )
 tt( 6, 6 )
 tt( 6, 7 )

	tt( 2, 13 )
 tt( 3, 13 )
 tt( 4, 13 )
 tt( 5, 13 )
 tt( 6, 13 )
 tt( 2, 14 )
 tt( 6, 14 )
 tt( 3, 15 )
 tt( 6, 15 )
 tt( 4, 16 )
 tt( 6, 16 )
 tt( 5, 17 )
 tt( 6, 17 )

 tt( 9, 3 )
 tt( 10, 3 )
 tt( 11, 3 )
 tt( 12, 3 )
 tt( 13, 3 )
 tt( 14, 3 )

 tt( 9, 4 )
 tt( 14, 4 )
 tt( 9, 5 )
 tt( 14, 5 )
 tt( 9, 6 )
 tt( 14, 6 )
 tt( 9, 7 )
 tt( 14, 7 )
 tt( 9, 8 )
 tt( 14, 8 )
 tt( 9, 9 )
 tt( 14, 9 )
 tt( 9, 10 )
 tt( 14, 10 )
 tt( 9, 11 )
 tt( 14, 11 )
 tt( 9, 12 )
 tt( 14, 12 )
 tt( 9, 13 )
 tt( 14, 13 )
 tt( 9, 14 )
 tt( 14, 14 )
 tt( 9, 15 )
 tt( 14, 15 )
 tt( 9, 16 )
 tt( 14, 16 )

 tt( 9, 17 )
 tt( 10, 17 )
 tt( 11, 17 )
 tt( 12, 17 )
 tt( 13, 17 )
 tt( 14, 17 )
 
 tt( 17, 3 )
 tt( 18, 3 )
 tt( 17, 4 )
 tt( 19, 4 )
 tt( 17, 5 )
 tt( 20, 5 )
 tt( 17, 6 )
 tt( 21, 6 )
 tt( 17, 7 )
 tt( 18, 7 )
 tt( 19, 7 )
 tt( 20, 7 )
 tt( 21, 7 )

 tt( 17, 13 )
 tt( 18, 13 )
 tt( 19, 13 )
 tt( 20, 13 )
 tt( 21, 13 )
 tt( 17, 14 )
 tt( 21, 14 )
 tt( 17, 15 )
 tt( 20, 15 )
 tt( 17, 16 )
 tt( 19, 16 )
 tt( 17, 17 )
 tt( 18, 17 )

end

-- level 2,4,6 8
function level2()

 tt( 5, 2 )
 tt( 4, 3 )
 tt( 3, 4 )
 tt( 2, 5 )
 
 tt( 3, 7 )
 tt( 4, 8 )
 tt( 5, 9 )
 tt( 6, 10 )
 tt( 5, 11 )
 tt( 4, 12 )
 tt( 3, 13 )
 tt( 2, 15 )
 tt( 3, 16 )
 tt( 4, 17 )
 tt( 5, 18 )

 tt( 18, 2 )
 tt( 19, 3 )
 tt( 20, 4 )
 tt( 21, 5 )
 tt( 20, 7 )
 tt( 19, 8 )
 tt( 18, 9 )
 tt( 17, 10 )
 tt( 18, 11 )
 tt( 19, 12 )
 tt( 20, 13 )

 tt( 21, 15 )
 tt( 20, 16 )
 tt( 19, 17 )
 tt( 18, 18 )

end

-- level 3
function level3()

 tt( 2, 5 )
 tt( 3, 5 )
 tt( 4, 5 )
 tt( 5, 5 )
 tt( 2, 6 )
 tt( 5, 6 )
 tt( 2, 7 )
 tt( 5, 7 )
 tt( 2, 8 )
 tt( 3, 8 )
 tt( 4, 8 )
 tt( 5, 8 )

 tt( 2, 12 )
 tt( 3, 12 )
 tt( 4, 12 )
 tt( 5, 12 )
 tt( 2, 13 )
 tt( 5, 13 )
 tt( 2, 14 )
 tt( 5, 14 )
 tt( 2, 15 )
 tt( 3, 15 )
 tt( 4, 15 )
 tt( 5, 15 )

 tt( 7, 5 )
 tt( 8, 5 )
 tt( 9, 5 )
 tt( 10, 5 )
 tt( 7, 6 )
 tt( 10, 6 )
 tt( 7, 7 )
 tt( 10, 7 )
 tt( 7, 8 )
 tt( 8, 8 )
 tt( 9, 8 )
 tt( 10, 8 )

 tt( 7, 12 )
 tt( 8, 12 )
 tt( 9, 12 )
 tt( 10, 12 )
 tt( 7, 13 )
 tt( 10, 13 )
 tt( 7, 14 )
 tt( 10, 14 )
 tt( 10, 15 )
 tt( 7, 15 )
 tt( 8, 15 )
 tt( 9, 15 )
 tt( 10, 15 )

 tt( 5, 9 )
 tt( 5, 10 )
 tt( 5, 11 )

 tt( 7, 9 )
 tt( 7, 10 )
 tt( 7, 11 )

 tt( 6, 8 )
 tt( 6, 12 )

 tt( 13, 5 )
 tt( 14, 5 )
 tt( 15, 5 )
 tt( 16, 5 )
 tt( 13, 6 )
 tt( 16, 6 )
 tt( 13, 7 )
 tt( 16, 7 )
 tt( 13, 8 )
 tt( 14, 8 )
 tt( 15, 8 )
 tt( 16, 8 )

 tt( 13, 12 )
 tt( 14, 12 )
 tt( 15, 12 )
 tt( 16, 12 )
 tt( 13, 13 )
 tt( 16, 13 )
 tt( 13, 14 )
 tt( 16, 14 )
 tt( 13, 15 )
 tt( 14, 15 )
 tt( 15, 15 )
 tt( 16, 15 )

 tt( 18, 5 )
 tt( 19, 5 )
 tt( 20, 5 )
 tt( 21, 5 )
 tt( 18, 6 )
 tt( 21, 6 )
 tt( 18, 7 )
 tt( 21, 7 )
 tt( 18, 8 )
 tt( 19, 8 )
 tt( 20, 8 )
 tt( 21, 8 )

 tt( 18, 12 )
 tt( 19, 12 )
 tt( 20, 12 )
 tt( 21, 12 )
 tt( 18, 13 )
 tt( 21, 13 )
 tt( 18, 14 )
 tt( 21, 14 )
 tt( 18, 15 )
 tt( 19, 15 )
 tt( 20, 15 )
 tt( 21, 15 )

 tt( 16, 9 )
 tt( 16, 10 )
 tt( 16, 11 )

 tt( 18, 9 )
 tt( 18, 10 )
 tt( 18, 11 )

 tt( 17, 8 )
 tt( 17, 12 )

end

-- level 5
function level5()

  tt( 2, 3 )
  tt( 3, 3 )
  tt( 4, 3 )
  tt( 5, 3 )
  tt( 6, 3 )
  tt( 7, 3 )
  tt( 2, 4 )
  tt( 3, 4 )
  tt( 4, 4 )
  tt( 5, 4 )
  tt( 6, 4 )
  tt( 7, 4 )
  tt( 2, 5 )
  tt( 3, 5 )
  tt( 4, 5 )
  tt( 5, 5 )
  tt( 6, 5 )
  tt( 7, 5 )
  tt( 2, 6 )
  tt( 3, 6 )
  tt( 4, 6 )
  tt( 5, 6 )
  tt( 6, 6 )
  tt( 7, 6 )
  tt( 2, 7 )
  tt( 3, 7 )
  tt( 4, 7 )
  tt( 5, 7 )
  tt( 6, 7 )
  tt( 7, 7 )
  tt( 2, 8 )
  tt( 3, 8 )
  tt( 4, 8 )
  tt( 5, 8 )
  tt( 6, 8 )
  tt( 7, 8 )

  tt( 2, 12 )
  tt( 3, 12 )
  tt( 4, 12 )
  tt( 5, 12 )
  tt( 6, 12 )
  tt( 7, 12 )
  tt( 2, 13 )
  tt( 3, 13 )
  tt( 4, 13 )
  tt( 5, 13 )
  tt( 6, 13 )
  tt( 7, 13 )
  tt( 2, 14 )
  tt( 3, 14 )
  tt( 4, 14 )
  tt( 5, 14 )
  tt( 6, 14 )
  tt( 7, 14 )
  tt( 2, 15 )
  tt( 3, 15 )
  tt( 4, 15 )
  tt( 5, 15 )
  tt( 6, 15 )
  tt( 7, 15 )
  tt( 2, 16 )
  tt( 3, 16 )
  tt( 4, 16 )
  tt( 5, 16 )
  tt( 6, 16 )
  tt( 7, 16 )
  tt( 2, 17 )
  tt( 3, 17 )
  tt( 4, 17 )
  tt( 5, 17 )
  tt( 6, 17 )
  tt( 7, 17 )
  
  tt( 16, 3 )
  tt( 17, 3 )
  tt( 18, 3 )
  tt( 19, 3 )
  tt( 20, 3 )
  tt( 21, 3 )
  tt( 16, 4 )
  tt( 17, 4 )
  tt( 18, 4 )
  tt( 19, 4 )
  tt( 20, 4 )
  tt( 21, 4 )
  tt( 16, 5 )
  tt( 17, 5 )
  tt( 18, 5 )
  tt( 19, 5 )
  tt( 20, 5 )
  tt( 21, 5 )
  tt( 16, 6 )
  tt( 17, 6 )
  tt( 18, 6 )
  tt( 19, 6 )
  tt( 20, 6 )
  tt( 21, 6 )
  tt( 16, 7 )
  tt( 17, 7 )
  tt( 18, 7 )
  tt( 19, 7 )
  tt( 20, 7 )
  tt( 21, 7 )
  tt( 16, 8 )
  tt( 17, 8 )
  tt( 18, 8 )
  tt( 19, 8 )
  tt( 20, 8 )
  tt( 21, 8 )

  tt( 16, 12 )
  tt( 17, 12 )
  tt( 18, 12 )
  tt( 19, 12 )
  tt( 20, 12 )
  tt( 21, 12 )
  tt( 16, 13 )
  tt( 17, 13 )
  tt( 18, 13 )
  tt( 19, 13 )
  tt( 20, 13 )
  tt( 21, 13 )
  tt( 16, 14 )
  tt( 17, 14 )
  tt( 18, 14 )
  tt( 19, 14 )
  tt( 20, 14 )
  tt( 21, 14 )
  tt( 16, 15 )
  tt( 17, 15 )
  tt( 18, 15 )
  tt( 19, 15 )
  tt( 20, 15 )
  tt( 21, 15 )
  tt( 16, 16 )
  tt( 17, 16 )
  tt( 18, 16 )
  tt( 19, 16 )
  tt( 20, 16 )
  tt( 21, 16 )
  tt( 16, 17 )
  tt( 17, 17 )
  tt( 18, 17 )
  tt( 19, 17 )
  tt( 20, 17 )
  tt( 21, 17 )

  tt( 6, 9 )
  tt( 7, 9 )
  tt( 6, 10 )
  tt( 7, 10 )
  tt( 6, 11 )
  tt( 7, 11 )

  tt( 16, 9 )
  tt( 17, 9 )
  tt( 16, 10 )
  tt( 17, 10 )
  tt( 16, 11 )
  tt( 17, 11 )

  tt( 8, 7 )
  tt( 9, 7 )
  tt( 10, 7 )
  tt( 11, 7 )
  tt( 12, 7 )
  tt( 13, 7 )
  tt( 14, 7 )
  tt( 15, 7 )

  tt( 8, 8 )
  tt( 9, 8 )
  tt( 10, 8 )
  tt( 11, 8 )
  tt( 12, 8 )
  tt( 13, 8 )
  tt( 14, 8 )
  tt( 15, 8 )

  tt( 8, 12 )
  tt( 9, 12 )
  tt( 10, 12 )
  tt( 11, 12 )
  tt( 12, 12 )
  tt( 13, 12 )
  tt( 14, 12 )
  tt( 15, 12 )

  tt( 8, 13 )
  tt( 9, 13 )
  tt( 10, 13 )
  tt( 11, 13 )
  tt( 12, 13 )
  tt( 13, 13 )
  tt( 14, 13 )
  tt( 15, 13 )

end

-- level 7
function level7()

   tt( 1, 1 )
   tt( 2, 1 )
   tt( 3, 1 )
   tt( 4, 1 )
   tt( 5, 1 )
   tt( 6, 1 )
   tt( 1, 2 )
   tt( 6, 2 )
   tt( 1, 3 )
   tt( 6, 3 )
   tt( 1, 4 )
   tt( 6, 4 )
   tt( 1, 5 )
   tt( 6, 5 )
   tt( 1, 6 )
   tt( 2, 6 )
   tt( 3, 6 )
   tt( 4, 6 )
   tt( 5, 6 )
   tt( 6, 6 )

   tt( 1, 14 )
   tt( 2, 14 )
   tt( 3, 14 )
   tt( 4, 14 )
   tt( 5, 14 )
   tt( 6, 14 )
   tt( 1, 15 )
   tt( 6, 15 )
   tt( 1, 16 )
   tt( 6, 16 )
   tt( 1, 17 )
   tt( 6, 17 )
   tt( 1, 18 )
   tt( 6, 18 )
   tt( 1, 19 )
   tt( 2, 19 )
   tt( 3, 19 )
   tt( 4, 19 )
   tt( 5, 19 )
   tt( 6, 19 )

   tt( 17, 1 )
   tt( 18, 1 )
   tt( 19, 1 )
   tt( 20, 1 )
   tt( 21, 1 )
   tt( 22, 1 )
   tt( 17, 2 )
   tt( 22, 2 )
   tt( 17, 3 )
   tt( 22, 3 )
   tt( 17, 4 )
   tt( 22, 4 )
   tt( 17, 5 )
   tt( 22, 5 )
   tt( 17, 6 )
   tt( 18, 6 )
   tt( 19, 6 )
   tt( 20, 6 )
   tt( 21, 6 )
   tt( 22, 6 )

   tt( 17, 14 )
   tt( 18, 14 )
   tt( 19, 14 )
   tt( 20, 14 )
   tt( 21, 14 )
   tt( 22, 14 )
   tt( 17, 15 )
   tt( 22, 15 )
   tt( 17, 16 )
   tt( 22, 16 )
   tt( 17, 17 )
   tt( 22, 17 )
   tt( 17, 18 )
   tt( 22, 18 )
   tt( 17, 19 )
   tt( 18, 19 )
   tt( 19, 19 )
   tt( 20, 19 )
   tt( 21, 19 )
   tt( 22, 19 )

   tt( 8, 7 )
   tt( 9, 7 )
   tt( 10, 7 )
   tt( 11, 7 )
   tt( 12, 7 )
   tt( 13, 7 )
   tt( 14, 7 )
   tt( 15, 7 )

   tt( 8, 8 )
   tt( 15, 8 )
   tt( 8, 9 )
   tt( 15, 9 )
   tt( 8, 10 )
   tt( 15, 10 )
   tt( 8, 11 )
   tt( 15, 11 )
   tt( 8, 12 )
   tt( 15, 12 )

   tt( 8, 13 )
   tt( 9, 13 )
   tt( 10, 13 )
   tt( 11, 13 )
   tt( 12, 13 )
   tt( 13, 13 )
   tt( 14, 13 )
   tt( 15, 13 )

end

function show_scores()

	local headerstring = "sc:"..numberfiller( score ).." hi:"..numberfiller( highscore ).." l:"..numberfiller( level, 2 ).." lives:"..lives

	-- simple 3d effect :-)
	print( headerstring, 5, 1, 5 )
	print( headerstring, 4, 0, 7 )

end

-- fill numbers with leading zero(s)
function numberfiller( n, m ) 

	local m = m or 5 -- default is: 5

	local string = tostr( n )
 local returnstring = ''
	
	for i = #string, m - 1 do
		returnstring = returnstring..'0'
	end

	return( returnstring..string )

end

-- show grid fast
function show_grid()

	-- back to front effect
	for x = gridx + gridxnums * gridpixelsteps, gridx, -gridpixelsteps do
		line( x, gridy - 1, x, gridy + gridynums * gridpixelsteps + 1, 8 )
	end

	for y = gridy + gridynums * gridpixelsteps, gridy, -gridpixelsteps do
		line( gridx - 1, y, gridx + gridxnums * gridpixelsteps + 1, y, 8 )
	end

end

function show_treasures ()

	for t in all( treasures ) do
	  spr( levels[level_mod8()].sprite, gridx+t.x * gridpixelsteps - 2, gridy + t.y * gridpixelsteps - 2 )
	end 

end

function show_cannons()

	-- left & right
	spr( 4, gridx - 6, gridy + leftcannon.position * gridpixelsteps - 3, 1, 1, false, false )
	spr( 4, gridx + gridxnums * gridpixelsteps - 1, gridy + rightcannon.position * gridpixelsteps - 3, 1, 1, true,  false )
	-- up & down
	spr( 6, gridx + uppercannon.position * gridpixelsteps - 3, gridy - 6, 1, 1, false, false )
	spr( 6, gridx + lowercannon.position * gridpixelsteps - 3, gridy + gridynums * gridpixelsteps - 1, 1, 1, false, true )

end

function show_bullets()

	if ( leftcannon.direction == 0 ) then
		spr( 8, gridx + leftbullet.position * gridpixelsteps - 3, gridy + leftcannon.position * gridpixelsteps - 1 )
	end
	if ( rightcannon.direction == 0 ) then
		spr( 8, gridx + rightbullet.position * gridpixelsteps - 3, gridy + rightcannon.position * gridpixelsteps - 1 )
	end
	if ( uppercannon.direction == 0 ) then
		spr( 9, gridx + uppercannon.position * gridpixelsteps - 2, gridy + upperbullet.position * gridpixelsteps - 3 )
	end
	if ( lowercannon.direction == 0 ) then
		spr( 9, gridx + lowercannon.position * gridpixelsteps -2, gridy + lowerbullet.position * gridpixelsteps - 3 )
	end

end

function show_spaceship()

	if ( spaceship.movement == 0 ) then
		spr( 0, gridx + spaceship.x * gridpixelsteps - 2, gridy + spaceship.y * gridpixelsteps - 2, 1, 1, false, false )
	elseif ( spaceship.movement == 1 ) then
		spr( 1, gridx + spaceship.x * gridpixelsteps - 2, gridy + spaceship.y * gridpixelsteps - 2, 1, 1, false, false )
	elseif ( spaceship.movement == 2 ) then
		spr( 2, gridx + spaceship.x * gridpixelsteps - 2, gridy + spaceship.y * gridpixelsteps - 2, 1, 1, false, false )
	elseif ( spaceship.movement == 3 ) then
		spr( 3, gridx + spaceship.x * gridpixelsteps - 2, gridy+spaceship.y*gridpixelsteps - 2, 1, 1, false, false )
	end

end

function collision_detection ()

	-- spaceship and bullets collision
	if ( spaceship.x == leftbullet.position  and spaceship.y == leftcannon.position ) or 
	   ( spaceship.x == rightbullet.position and spaceship.y == rightcannon.position ) or
	   ( spaceship.x == uppercannon.position and spaceship.y == upperbullet.position ) or
	   ( spaceship.x == lowercannon.position and spaceship.y == lowerbullet.position ) then

  return ( true )
		
	end

 return ( false )
	
end

function press_any_key()

	-- wait for a press
	while not ( btn( 4 ) or btn( 5 ) ) do
	end

	-- and  waiting for a release
	while ( btn( 4 ) or btn( 5 ) ) do
	end

end

function welcome_screen()

	cls()

 print( "ocean", 12, 35, 12 )
 color ( 7 )

	cursor( 12, 35 )

	print( "      and flexoft presents\n" )
 print( "   transversion (remake)\n\n\n" )
	print( "      press any key!\n\n\n" )
	print( "        -= 2018 =-" )

	press_any_key()

end

function level_mod8()

	return( ( level - 1 ) % 8 ) + 1

end

function level_init()

 for t in all( treasures ) do
      del( treasures, t )
 end

		-- level pointer
 local l = level_mod8()

 if     ( l == 1 ) then
  level1()
 elseif ( l == 3 ) then
  level3()
 elseif ( l == 5 ) then
  level5()
 elseif ( l == 7 ) then
  level7()
 else
  level2()
 end

end

function _init()

	welcome_screen()

	game_init()

	level_init()
	_update = level_intro_update
	_draw   = level_intro_daaw
	
end

function level_intro_update()
	
 if ( btnp( 4 ) or btnp( 5 ) ) then

		_update = game_update
		_draw   = game_draw

	end

end

function level_intro_daaw()

	cls()
	color( 7 )

	local l = level_mod8()

 spr( levels[l].sprite, 20, 52 )

 print( "       "..numberfiller( level, 2).."\n", 20, 40, 10 )

 cursor( 20, 40 )
 color ( 7 )
 print( "level:\n" )
 print( "  .... "..numberfiller( levels[l].point, 2 ).." points\n" )
 print( "'x' or 'z' to continue\n" )
 print( "score: "..numberfiller( score ).."\n" )

end

function gameover_update()

	if ( btnp( 4 ) or btnp( 5 ) ) then

   game_reset()
   game_init()

   level_init()
   _update = level_intro_update
   _draw   = level_intro_daaw

		end

end

function gameover_draw()

	cls()
	color( 7 )

	cursor( 35, 45 )
 
 print( "  game over!" )

 -- if new highscore
 if ( score >= highscore ) then
 	highscore = score
 	print( "\n\n\n\nnew high score!", 8 )
 end

end

function death_update()

 t += 1

 if ( spaceship.movement < 4 ) then 
  spaceship.movement += 1
 else
  spaceship.movement = 0
 end

if ( t > 60 ) then
  lives -= 1

  if ( lives < 0 ) then
   -- game over
   _update = gameover_update
   _draw   = gameover_draw 
  else
   -- you can try the bonus levels (even number) only once
   if ( level % 2 == 0 ) then
     level += 1
   end

   game_init()
   
   level_init()
   _update = level_intro_update
   _draw   = level_intro_daaw
  end

 end 

end

function game_update()

	-- increase my global timer
	t += 1
	
	-- cannons movement
	if ( t % 4 == 0 ) then

		leftcannon.position  += leftcannon.direction
		rightcannon.position += rightcannon.direction
		uppercannon.position += uppercannon.direction
		lowercannon.position += lowercannon.direction
	
		-- check the end and turn back
		if ( leftcannon.position <= 0 or leftcannon.position >= gridynums ) then
		  leftcannon.direction *= -1
		end
		if ( rightcannon.position <= 0 or rightcannon.position >= gridynums ) then
		  rightcannon.direction *= -1
		end
		if ( uppercannon.position <= 0 or uppercannon.position >= gridxnums ) then
		  uppercannon.direction *= -1
		end
		if ( lowercannon.position <= 0 or lowercannon.position >= gridxnums ) then
		  lowercannon.direction *= -1
		end

	end

	-- bullets movement a bit faster
	if ( t % 3 == 0 and _update != death_update ) then

		if ( leftcannon.direction == 0 ) then
			leftbullet.position += 1
		end
		if ( rightcannon.direction == 0 ) then
			rightbullet.position -= 1
		end
		if ( uppercannon.direction == 0 ) then
			upperbullet.position += 1
		end
		if ( lowercannon.direction == 0 ) then
			lowerbullet.position -= 1
		end

  if ( collision_detection() ) then
   t = 0
  -- hit
   _update = death_update
   --_draw   = death_draw
  end

	end

	-- fire bullets ?
	if ( leftcannon.direction != 0 and leftcannon.position == spaceship.y ) then
		leftcannon.lastdirection = leftcannon.direction
		leftcannon.direction = 0
		leftbullet.position = 0
	end
	if ( rightcannon.direction != 0 and rightcannon.position == spaceship.y ) then
		rightcannon.lastdirection = rightcannon.direction
		rightcannon.direction = 0
		rightbullet.position = gridxnums
	end
	if ( uppercannon.direction != 0 and uppercannon.position == spaceship.x ) then
		uppercannon.lastdirection = uppercannon.direction
		uppercannon.direction = 0
		upperbullet.position = 0
	end
	if ( lowercannon.direction != 0 and lowercannon.position == spaceship.x ) then
		lowercannon.lastdirection = lowercannon.direction
		lowercannon.direction = 0
		lowerbullet.position = gridynums
	end

	-- end of the bullets ?
	if ( leftbullet.position == gridxnums ) then
		leftcannon.direction = leftcannon.lastdirection
		leftbullet.position = -1
	end
	if ( rightbullet.position == 0 ) then
		rightcannon.direction = rightcannon.lastdirection
		rightbullet.position = -1
	end
	if ( upperbullet.position == gridynums ) then
		uppercannon.direction = uppercannon.lastdirection
		upperbullet.position = -1
	end
	if ( lowerbullet.position == 0 ) then
		lowercannon.direction = lowercannon.lastdirection
		lowerbullet.position = -1 
	end

	-- key handler
	if ( t % 4 == 0 and _update != death_update ) then 

		if ( btn( 0 ) and spaceship.x > 0 ) then
			spaceship.x -= 1
			spaceship.movement = 2
			sfx(0)
		end
		if ( btn( 1 ) and spaceship.x < gridxnums  ) then 
			spaceship.x += 1
			spaceship.movement = 3
			sfx(0)
		end
		if ( btn( 2 ) and spaceship.y > 0 ) then 
			spaceship.y -= 1
			spaceship.movement = 0
			sfx(0)
		end
		if ( btn( 3 ) and spaceship.y < gridynums ) then 
			spaceship.y += 1
			spaceship.movement = 1
			sfx( 0 )
		end

  if ( collision_detection() ) then

   t = 0
  -- hit
   _update = death_update
   --_draw   = death_draw
  end

	end

	-- collection
	for t in all( treasures ) do
		if ( spaceship.x == t.x and spaceship.y == t.y ) then
		  del( treasures, t )
		  score += levels[level_mod8()].point
		end

		if ( #treasures == 0 ) then
		 -- end of level

		 game_init()

		 level += 1
		 
   level_init()
   _update = level_intro_update
   _draw   = level_intro_daaw

		end

	end

end

function game_draw()

 	cls()

 	show_scores()	
 	show_grid()	
 	--
 	show_treasures()
 	show_cannons()
 	show_bullets()
 	
 	show_spaceship()

	print( stat( 7 ), 0, 123, 8)
	print( 'mem:'..stat( 0 )..' cpu:'..stat( 1 )..' '..t, 9, 123, 7 )

end
__gfx__
00700000700070000077700077700000a000000000000000aaaaaaa000000000a000a0000a0a0000000000000000000000000000000000000000000000000000
07770000768670000776000006770000aa000000000000000a0a0a00000000000a0a0a00a909a000000000000000000000000000000000000000000000000000
77c7700077c7700077c8000008c77000a7a000000000000000aaa0000000000000a000a0a909a000000000000000000000000000000000000000000000000000
76867000077700000776000006770000aaaa000000000000000a00000000000000000000a909a000000000000000000000000000000000000000000000000000
70007000007000000077700077700000a7a0000000000000000000000000000000000000a909a000000000000000000000000000000000000000000000000000
00000000000000000000000000000000aa00000000000000000000000000000000000000a909a000000000000000000000000000000000000000000000000000
00000000000000000000000000000000a0000000000000000000000000000000000000000a0a0000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01c10000bbbbb000c1c1c0000ddd00000ccc000001c1000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1ccc1000b000b0001ccc1000dcccd000c6d6c0001ccc100000000000000000000000000000000000000000000000000000000000000000000000000000000000
cc9cc000b0b0b000cc0cc000dd6dd000cdcdc000cc9cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000
1ccc1000b0b0b0001ccc1000dcccd000c6d6c0001ccc100000000000000000000000000000000000000000000000000000000000000000000000000000000000
01c10000bb00b000c1c1c0000ddd00000ccc000001c1000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000150712b0733107136073390713b0733b05034070250701d0301b020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
