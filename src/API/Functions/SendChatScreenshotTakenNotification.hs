-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatScreenshotTakenNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendChatScreenshotTakenNotification = 
 SendChatScreenshotTakenNotification { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendChatScreenshotTakenNotification where
 toJSON (SendChatScreenshotTakenNotification { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatScreenshotTakenNotification", "chat_id" A..= chat_id ]
-- sendChatScreenshotTakenNotification SendChatScreenshotTakenNotification  { chat_id :: Int } 

