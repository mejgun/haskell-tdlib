-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatChatList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

--main = putStrLn "ok"

data SetChatChatList = 
 SetChatChatList { chat_list :: ChatList.ChatList, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatChatList where
 toJSON (SetChatChatList { chat_list = chat_list, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatChatList", "chat_list" A..= chat_list, "chat_id" A..= chat_id ]
-- setChatChatList SetChatChatList  { chat_list :: ChatList.ChatList, chat_id :: Int } 

