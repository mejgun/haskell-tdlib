-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

--main = putStrLn "ok"

data GetChats = 
 GetChats { limit :: Int, offset_chat_id :: Int, offset_order :: Int, chat_list :: ChatList.ChatList }  -- deriving (Show)

instance T.ToJSON GetChats where
 toJSON (GetChats { limit = limit, offset_chat_id = offset_chat_id, offset_order = offset_order, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "getChats", "limit" A..= limit, "offset_chat_id" A..= offset_chat_id, "offset_order" A..= offset_order, "chat_list" A..= chat_list ]
-- getChats GetChats  { limit :: Int, offset_chat_id :: Int, offset_order :: Int, chat_list :: ChatList.ChatList } 

