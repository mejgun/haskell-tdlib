-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

--main = putStrLn "ok"

data SearchChatMessages = 
 SearchChatMessages { filter :: SearchMessagesFilter.SearchMessagesFilter, limit :: Int, offset :: Int, from_message_id :: Int, sender_user_id :: Int, query :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchChatMessages where
 toJSON (SearchChatMessages { filter = filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMessages", "filter" A..= filter, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "sender_user_id" A..= sender_user_id, "query" A..= query, "chat_id" A..= chat_id ]
-- searchChatMessages SearchChatMessages  { filter :: SearchMessagesFilter.SearchMessagesFilter, limit :: Int, offset :: Int, from_message_id :: Int, sender_user_id :: Int, query :: String, chat_id :: Int } 

