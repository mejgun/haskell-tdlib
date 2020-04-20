-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

--main = putStrLn "ok"

data SetChatLocation = 
 SetChatLocation { location :: ChatLocation.ChatLocation, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatLocation where
 toJSON (SetChatLocation { location = location, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatLocation", "location" A..= location, "chat_id" A..= chat_id ]
-- setChatLocation SetChatLocation  { location :: ChatLocation.ChatLocation, chat_id :: Int } 

