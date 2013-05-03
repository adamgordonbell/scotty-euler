{-# LANGUAGE OverloadedStrings #-}
module Euler where
import Web.Scotty

import Data.Monoid (mconcat)
import Text.Blaze.Html.Renderer.String(renderHtml)
import Data.Char (toLower)
import Data.List (sort)
import Network.HTTP.Types(status404)
import qualified Data.Text.Lazy as T
import qualified Web.Scotty as S
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Data.List
import qualified Views.Index
import qualified Views.Answer
import Model

main = scotty 3000 $ do
    get "/" $ do
             blaze . Views.Index.render $ answers
    get "/answer/:number" $ do
        a <- param "number"
        case lookup1 a of
            Nothing -> status status404
            Just value -> blaze . Views.Answer.render $ value


lookup1 i = find (\ x -> number x == i) answers

blaze :: H.Html -> ActionM()
blaze = S.html . T.pack . renderHtml


