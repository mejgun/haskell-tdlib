-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatScheduledMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatScheduledMessages = 
 GetChatScheduledMessages { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatScheduledMessages where
 toJSON (GetChatScheduledMessages { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatScheduledMessages", "chat_id" A..= chat_id ]
-- getChatScheduledMessages GetChatScheduledMessages  { chat_id :: Int } 

