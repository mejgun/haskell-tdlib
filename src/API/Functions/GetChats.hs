-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChats where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

data GetChats = 
 GetChats { limit :: Maybe Int, offset_chat_id :: Maybe Int, offset_order :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  deriving (Show)

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
    limit <- optional $ o A..: "limit"
    offset_chat_id <- optional $ o A..: "offset_chat_id"
    offset_order <- optional $ o A..: "offset_order"
    chat_list <- optional $ o A..: "chat_list"
    return $ GetChats { limit = limit, offset_chat_id = offset_chat_id, offset_order = offset_order, chat_list = chat_list }