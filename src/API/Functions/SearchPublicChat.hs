-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchPublicChat = 
 SearchPublicChat { username :: String }  -- deriving (Show)

instance T.ToJSON SearchPublicChat where
 toJSON (SearchPublicChat { username = username }) =
  A.object [ "@type" A..= T.String "searchPublicChat", "username" A..= username ]
-- searchPublicChat SearchPublicChat  { username :: String } 

