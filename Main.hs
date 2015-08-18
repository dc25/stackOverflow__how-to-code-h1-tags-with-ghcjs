import GHCJS.DOM
import GHCJS.DOM.Document
import GHCJS.DOM.HTMLElement
import GHCJS.DOM.Element
import GHCJS.DOM.HTMLButtonElement
import GHCJS.DOM.Node
import GHCJS.Types
import GHCJS.Foreign
import Control.Monad.Trans

foreign import javascript unsafe 
   "alert($1)" 
   alert :: JSString -> IO ()

main = runWebGUI $ \win -> do
        Just doc <- webViewGetDomDocument win
        Just body <- documentGetBody doc
        Just button <- fmap castToHTMLButtonElement <$> documentCreateElement doc "button"
        nodeAppendChild body $ Just button
        elementOnclick button $ liftIO $  alert $ toJSString "OUCH!"
        htmlElementSetInnerHTML button "voila!"
