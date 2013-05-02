{-# LANGUAGE OverloadedStrings #-}
module Euler where
import Web.Scotty

import Data.Monoid (mconcat)
import Text.Blaze.Html.Renderer.String(renderHtml)
import Data.Char (toLower)
import Data.List (sort)
import qualified Data.Text.Lazy as T
import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Web.Scotty as S
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import qualified Views.Index

main = scotty 3000 $ do
    get "/" $ do
             blaze $ Views.Index.render euler1

euler1 :: Int
euler1 = sum [ x  |x <- [1..1000], x `mod` 5 == 0 || x `mod` 3 == 0]

blaze = S.html . T.pack . renderHtml

euler2 = undefined

