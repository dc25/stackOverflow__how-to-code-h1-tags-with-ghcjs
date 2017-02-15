import GHCJS.DOM (runWebGUI, webViewGetDomDocument)
import GHCJS.DOM.Document (getBody, createElement)
import GHCJS.DOM.Element (click, setInnerHTML)
import GHCJS.DOM.HTMLHeadingElement (castToHTMLHeadingElement)
import GHCJS.DOM.HTMLParagraphElement (castToHTMLParagraphElement)
import GHCJS.DOM.Node (appendChild)
import GHCJS.DOM.EventM (on)

main = runWebGUI $ \win -> do
        Just doc <- webViewGetDomDocument win
        Just body <- getBody doc

        Just h1 <- fmap castToHTMLHeadingElement <$> createElement doc (Just "h1")
        appendChild body $ Just h1
        setInnerHTML h1 (Just "Hello World")
        on h1 click $ setInnerHTML h1 (Just "Clicked")

        Just p <- fmap castToHTMLParagraphElement <$> createElement doc (Just "p")
        appendChild body $ Just p
        setInnerHTML p (Just "This is my test document.")

        return ()
