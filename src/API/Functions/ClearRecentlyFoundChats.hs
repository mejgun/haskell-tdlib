-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearRecentlyFoundChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ClearRecentlyFoundChats = 
 ClearRecentlyFoundChats -- deriving (Show)

instance T.ToJSON ClearRecentlyFoundChats where
 toJSON (ClearRecentlyFoundChats {  }) =
  A.object [ "@type" A..= T.String "clearRecentlyFoundChats" ]
-- clearRecentlyFoundChats ClearRecentlyFoundChats 

