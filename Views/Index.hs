{-# LANGUAGE OverloadedStrings #-}
module Views.Index where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes

render answer = do
  html $ do
    body $ do
      h1 "My Euler Answers"
      ul $ do
        li . toHtml $ answer
