--[[----------------------------------------------------------------------------

  Application Name:
  SobelMagnitude

  Summary:
  Extracting edges in image, including edge strength information.

  How to Run:
  Starting this sample is possible either by running the app (F5) or
  debugging (F7+F10). Setting breakpoint on the first row inside the 'main'
  function allows debugging step-by-step after 'Engine.OnStarted' event.
  Results can be seen in the image viewer on the DevicePage.
  Restarting the Sample may be necessary to show images after loading the webpage.
  To run this Sample a device with SICK Algorithm API and AppEngine >= V2.5.0 is
  required. For example SIM4000 with latest firmware. Alternatively the Emulator
  in AppStudio 2.3 or higher can be used.

  More Information:
  Tutorial "Algorithms - Filtering and Arithmetic".

------------------------------------------------------------------------------]]

--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1000 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create("viewer2D1")

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
