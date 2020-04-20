-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatNearby = 
 ChatNearby { distance :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ChatNearby where
 toJSON (ChatNearby { distance = distance, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "chatNearby", "distance" A..= distance, "chat_id" A..= chat_id ]
-- chatNearby ChatNearby  { distance :: Int, chat_id :: Int } 

