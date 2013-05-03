{-# LANGUAGE OverloadedStrings #-}
module Views.Answer where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import Model
import Control.Monad

render :: EulerAnswer -> Html
render answer = do
  html $ docTypeHtml $ do
    body $ do
      h1 "My Euler Answers"
      ul $ li . toHtml . resultLine $ answer 

resultLine :: EulerAnswer -> String
resultLine r = concat ["Euler Problem ", show . number $ r, ": ", show . result $ r]

