-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageEmbeddingCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns an HTML code for embedding the message. Available only for messages in supergroups and channels with a username
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
-- 
-- __for_album__ Pass true to return an HTML code for embedding of the whole media album
data GetMessageEmbeddingCode = 

 GetMessageEmbeddingCode { for_album :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetMessageEmbeddingCode where
 toJSON (GetMessageEmbeddingCode { for_album = for_album, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageEmbeddingCode", "for_album" A..= for_album, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageEmbeddingCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageEmbeddingCode" -> parseGetMessageEmbeddingCode v
   _ -> mempty
  where
   parseGetMessageEmbeddingCode :: A.Value -> T.Parser GetMessageEmbeddingCode
   parseGetMessageEmbeddingCode = A.withObject "GetMessageEmbeddingCode" $ \o -> do
    for_album <- o A..:? "for_album"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageEmbeddingCode { for_album = for_album, message_id = message_id, chat_id = chat_id }