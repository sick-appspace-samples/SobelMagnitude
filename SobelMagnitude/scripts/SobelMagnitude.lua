
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1000 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create()

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  local img = Image.load('resources/SobelMagnitude.bmp')
  viewer:clear()
  viewer:addImage(img)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Applying gauss filter to remove salt/pepper noise
  local img2 = img:gauss(5)
  viewer:addImage(img2)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Applying sobel filter and viewing magnitudes in Dx and Dy directions
  local img3 = img2:sobelMagnitude()
  viewer:addImage(img3)
  viewer:present()
  print('App finished.')
end

Script.register('Engine.OnStarted', main)
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event

--End of Function and Event Scope--------------------------------------------------
