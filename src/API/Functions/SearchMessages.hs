-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

--main = putStrLn "ok"

data SearchMessages = 
 SearchMessages { limit :: Int, offset_message_id :: Int, offset_chat_id :: Int, offset_date :: Int, query :: String, chat_list :: ChatList.ChatList }  -- deriving (Show)

instance T.ToJSON SearchMessages where
 toJSON (SearchMessages { limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "searchMessages", "limit" A..= limit, "offset_message_id" A..= offset_message_id, "offset_chat_id" A..= offset_chat_id, "offset_date" A..= offset_date, "query" A..= query, "chat_list" A..= chat_list ]
-- searchMessages SearchMessages  { limit :: Int, offset_message_id :: Int, offset_chat_id :: Int, offset_date :: Int, query :: String, chat_list :: ChatList.ChatList } 

