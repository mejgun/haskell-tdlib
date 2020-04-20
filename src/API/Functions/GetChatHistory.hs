-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatHistory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatHistory = 
 GetChatHistory { only_local :: Bool, limit :: Int, offset :: Int, from_message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatHistory where
 toJSON (GetChatHistory { only_local = only_local, limit = limit, offset = offset, from_message_id = from_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatHistory", "only_local" A..= only_local, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "chat_id" A..= chat_id ]
-- getChatHistory GetChatHistory  { only_local :: Bool, limit :: Int, offset :: Int, from_message_id :: Int, chat_id :: Int } 



instance T.FromJSON GetChatHistory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatHistory" -> parseGetChatHistory v
  where
   parseGetChatHistory :: A.Value -> T.Parser GetChatHistory
   parseGetChatHistory = A.withObject "GetChatHistory" $ \o -> do
    only_local <- o A..: "only_local"
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    from_message_id <- o A..: "from_message_id"
    chat_id <- o A..: "chat_id"
    return $ GetChatHistory { only_local = only_local, limit = limit, offset = offset, from_message_id = from_message_id, chat_id = chat_id }