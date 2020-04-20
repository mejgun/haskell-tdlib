-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatPinnedMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatPinnedMessage = 
 GetChatPinnedMessage { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatPinnedMessage where
 toJSON (GetChatPinnedMessage { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatPinnedMessage", "chat_id" A..= chat_id ]
-- getChatPinnedMessage GetChatPinnedMessage  { chat_id :: Int } 

