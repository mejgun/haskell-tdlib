-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PinChatMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PinChatMessage = 
 PinChatMessage { disable_notification :: Bool, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON PinChatMessage where
 toJSON (PinChatMessage { disable_notification = disable_notification, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "pinChatMessage", "disable_notification" A..= disable_notification, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- pinChatMessage PinChatMessage  { disable_notification :: Bool, message_id :: Int, chat_id :: Int } 

