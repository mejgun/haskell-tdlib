-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatAction as ChatAction

--main = putStrLn "ok"

data SendChatAction = 
 SendChatAction { action :: ChatAction.ChatAction, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendChatAction where
 toJSON (SendChatAction { action = action, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatAction", "action" A..= action, "chat_id" A..= chat_id ]
-- sendChatAction SendChatAction  { action :: ChatAction.ChatAction, chat_id :: Int } 

