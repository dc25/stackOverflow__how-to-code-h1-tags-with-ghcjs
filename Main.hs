import GHCJS.DOM (runWebGUI, webViewGetDomDocument)
import GHCJS.DOM.Document (getBody, createElement)
import GHCJS.DOM.Element (click, setInnerHTML)
import GHCJS.DOM.HTMLButtonElement (castToHTMLButtonElement)
import GHCJS.DOM.Node (appendChild)
import GHCJS.DOM.EventM (on)
import Control.Monad.Trans (liftIO)
import Data.JSString (JSString, pack)

foreign import javascript unsafe 
   "alert($1)" 
   alert :: JSString -> IO ()

main = runWebGUI $ \win -> do
        Just doc <- webViewGetDomDocument win
        Just body <- getBody doc
        Just button <- fmap castToHTMLButtonElement <$> createElement doc (Just "button")
        appendChild body $ Just button
        on button click $ liftIO $ alert $ pack "OUCH!" 
        setInnerHTML button (Just "voila!")
