-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PublicMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PublicMessageLink = 
 PublicMessageLink { html :: String, link :: String }  -- deriving (Show)

instance T.ToJSON PublicMessageLink where
 toJSON (PublicMessageLink { html = html, link = link }) =
  A.object [ "@type" A..= T.String "publicMessageLink", "html" A..= html, "link" A..= link ]
-- publicMessageLink PublicMessageLink  { html :: String, link :: String } 

