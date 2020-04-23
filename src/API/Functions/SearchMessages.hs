-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

data SearchMessages = 
 SearchMessages { limit :: Maybe Int, offset_message_id :: Maybe Int, offset_chat_id :: Maybe Int, offset_date :: Maybe Int, query :: Maybe String, chat_list :: Maybe ChatList.ChatList }  deriving (Show)

instance T.ToJSON SearchMessages where
 toJSON (SearchMessages { limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "searchMessages", "limit" A..= limit, "offset_message_id" A..= offset_message_id, "offset_chat_id" A..= offset_chat_id, "offset_date" A..= offset_date, "query" A..= query, "chat_list" A..= chat_list ]

instance T.FromJSON SearchMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchMessages" -> parseSearchMessages v
   _ -> mempty
  where
   parseSearchMessages :: A.Value -> T.Parser SearchMessages
   parseSearchMessages = A.withObject "SearchMessages" $ \o -> do
    limit <- optional $ o A..: "limit"
    offset_message_id <- optional $ o A..: "offset_message_id"
    offset_chat_id <- optional $ o A..: "offset_chat_id"
    offset_date <- optional $ o A..: "offset_date"
    query <- optional $ o A..: "query"
    chat_list <- optional $ o A..: "chat_list"
    return $ SearchMessages { limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list }