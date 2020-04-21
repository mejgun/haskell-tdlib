-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetMessageLink = 
 GetMessageLink { message_id :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON GetMessageLink where
 toJSON (GetMessageLink { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageLink", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageLink" -> parseGetMessageLink v
   _ -> mempty
  where
   parseGetMessageLink :: A.Value -> T.Parser GetMessageLink
   parseGetMessageLink = A.withObject "GetMessageLink" $ \o -> do
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ GetMessageLink { message_id = message_id, chat_id = chat_id }