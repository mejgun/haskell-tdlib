-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatHistory where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatHistory = 
 GetChatHistory { only_local :: Maybe Bool, limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetChatHistory where
 toJSON (GetChatHistory { only_local = only_local, limit = limit, offset = offset, from_message_id = from_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatHistory", "only_local" A..= only_local, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatHistory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatHistory" -> parseGetChatHistory v
   _ -> mempty
  where
   parseGetChatHistory :: A.Value -> T.Parser GetChatHistory
   parseGetChatHistory = A.withObject "GetChatHistory" $ \o -> do
    only_local <- optional $ o A..: "only_local"
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    from_message_id <- optional $ o A..: "from_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetChatHistory { only_local = only_local, limit = limit, offset = offset, from_message_id = from_message_id, chat_id = chat_id }