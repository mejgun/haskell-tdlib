-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

data GetChats = 
 GetChats { limit :: Int, offset_chat_id :: Int, offset_order :: Int, chat_list :: ChatList.ChatList }  deriving (Show)

instance T.ToJSON GetChats where
 toJSON (GetChats { limit = limit, offset_chat_id = offset_chat_id, offset_order = offset_order, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "getChats", "limit" A..= limit, "offset_chat_id" A..= offset_chat_id, "offset_order" A..= offset_order, "chat_list" A..= chat_list ]

instance T.FromJSON GetChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChats" -> parseGetChats v
   _ -> mempty
  where
   parseGetChats :: A.Value -> T.Parser GetChats
   parseGetChats = A.withObject "GetChats" $ \o -> do
    limit <- o A..: "limit"
    offset_chat_id <- o A..: "offset_chat_id"
    offset_order <- o A..: "offset_order"
    chat_list <- o A..: "chat_list"
    return $ GetChats { limit = limit, offset_chat_id = offset_chat_id, offset_order = offset_order, chat_list = chat_list }