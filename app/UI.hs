import Graphics.UI.Threepenny.Core as UI
import qualified Graphics.UI.Threepenny as UI
import System.Environment
import Data.Maybe
import Game
import Grid
import RunGame
--import Main 
import System.IO


canWidth,canHeight :: Num a => a
canWidth  = 600
canHeight = 600



main :: IO ()
main =
  do
    hSetBuffering stdout LineBuffering
    [port] <- getArgs
    startGUI defaultConfig {jsPort = Just (read port)} setup




setup :: Window -> UI ()
setup window =
  
  do -- Create them user interface elements
   -- canvas         <- mkCanvas canWidth canHeight   -- The drawing area
    return window # set title "Minesweeper"
     --getBody window #+ [column [pure canvas]]
    let button = UI.button # set UI.text "Click me!"
    currentCoordinates  <- UI.span # set text "Coordinates: "
    currentCell  <- UI.span # set text "Cell: "
    line <- UI.grid [[button]]
     -- Styling
    getBody window # set style [("backgroundColor","lightblue"),
                                 ("textAlign","center")]
    createDisplay
    
    -- left  <- UI.div # set style [("color", "red"), ("border-style", "solid")]
    --     #. "small-4 columns"
    --     #+  [ UI.h1     # set UI.text "Left"
    --         , UI.button # set UI.text "Click me"
    --         ]
    -- right <- UI.div
    --     #. "small-8 columns"
    --     #+  [ UI.h1  # set UI.text "Right"
    --         , UI.div #. "panel" #+
    --             [ UI.span # set UI.text "This and subsequent examples use "
    --             , UI.a
    --                 # set UI.href "https://foundation.zurb.com/sites/docs/v/5.5.3"
    --                 # set UI.text "Foundation"
    --             , UI.span # set UI.text ", a CSS framework."
    --             ]
    --         ]
    let d = UI.div # set style [("border-style", "solid"), ("border-width", "1px"), ("border-color", "black"), ("width", "48px"), ("height", "48px")]
    let g = UI.grid $ replicate 10 $ replicate 10 d
    wrap <- UI.div #. "wrap"
        -- # set style [("width","600px"),("height","600px"),("border","solid black 1px")]
        # set (attr "tabindex") "1" -- allow key presses
        #+ [g]
    getBody window #+ [element wrap]
    -- getBody window #+
    --     [ UI.div #. "row" #+
    --         [ element left
    --         , element right
    --         ]
    --     ]
    getBody window #+ [element currentCell]
    getBody window #+ [element currentCoordinates]

    -- on UI.mousemove   wrap $ \c ->
    --     element out # set text ("cell: " ++ show c)
    on UI.mousedown      wrap $ \c ->
        element currentCoordinates # set text ("cell: " ++ show c)
    on UI.mousedown      wrap $ \c ->
        element currentCell # set text ("cell: " ++ show (getCellCoordinates c))
        -- draw some rectangles
   
    
    return()

createDisplay :: UI Element 
createDisplay = do
  canvas <- UI.canvas
    # set UI.width  canWidth
    # set UI.height canHeight    
  return canvas  


    -- setCanvas canvas
    -- let l1 = [(50,0), (50,500)]
    -- let l2 = [(100,0), (100,500)]
    -- let l3 = [(150,0), (150,500)]
    -- let l4 = [(200,0), (200,500)]
    -- let l5 = [(250,0), (250,500)]
    -- let l6 = [(300,0), (300,500)]
    -- let l7 = [(350,0), (350,500)]
    -- let l8 = [(400,0), (400,500)]
    -- let l9 = [(450,0), (450,500)]
    -- let l10 = [(50,0), (50,500)]
    -- -- path "black" l1 canvas
    -- path "black" l2 canvas
    -- path "black" l3 canvas
    -- path "black" l4 canvas
    -- path "black" l5 canvas
    -- path "black" l6 canvas
    -- path "black" l7 canvas
    -- path "black" l8 canvas
    -- path "black" l9 canvas


-- setCanvas :: Element -> UI()
-- setCanvas canvas = do

  -- do 
    -- Prints the current canvas size on the UI
    --set UI.fillStyle (UI.solidColor (UI.RGB 0 0 0)) (pure canvas)
   -- UI.fillText ("browser") (100,100) canvas
    -- let l1 = [(50,0), (50,500)]
    -- let l2 = [(100,0), (100,500)]
    -- let l3 = [(150,0), (150,500)]
    -- let l4 = [(200,0), (200,500)]
    -- let l5 = [(250,0), (250,500)]
    -- let l6 = [(300,0), (300,500)]
    -- let l7 = [(350,0), (350,500)]
    -- let l8 = [(400,0), (400,500)]
    -- let l9 = [(450,0), (450,500)]
   -- let l10 = [(50,0), (50,500)]
    -- path "black" l1 canvas
    -- path "black" l2 canvas
    -- path "black" l3 canvas
    -- path "black" l4 canvas
    -- path "black" l5 canvas
    -- path "black" l6 canvas
    -- path "black" l7 canvas
    -- path "black" l8 canvas
    -- path "black" l9 canvas
    --path "black" l10 canvas

    -- let l11 = [(0,50), (500,50)]
    -- let l12 = [(0,100), (500,100)]
    -- let l13 = [(0,150), (500,150)]
    -- let l14 = [(0,200), (500,200)]
    -- let l15 = [(0,250), (500,250)]     
    -- let l16 = [(0,300), (500,300)]
    -- let l17 = [(0,350), (500,350)]
    -- let l18 = [(0,400), (500,400)]
    -- let l19 = [(0,450), (500,450)]
    -- path "black" l11 canvas
    -- path "black" l12 canvas
    -- path "black" l13 canvas
    -- path "black" l14 canvas
    -- path "black" l15 canvas
    -- path "black" l16 canvas
    -- path "black" l17 canvas
    -- path "black" l18 canvas
    -- path "black" l19 canvas

getCellCoordinates :: (Double, Double) -> (Int,Int)
getCellCoordinates (x,y) = (round((x + 25) / 50) -1, round((y + 25) / 50) -1)
-- lineTo :: Point -> Canvas -> UI () 
-- lineTo point canvas