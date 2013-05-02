{-# LANGUAGE OverloadedStrings #-}
module Views.Index where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import Model
import Control.Monad

render :: [EulerAnswer] -> Html
render answers = do
  html $ docTypeHtml $ do
    body $ do
      h1 "My Euler Answers"
      ul $ forM_ answers (li . toHtml . resultLine)

resultLine :: EulerAnswer -> String
resultLine r = concat ["Euler Problem ", show . number $ r, ": ", show . result $ r]

