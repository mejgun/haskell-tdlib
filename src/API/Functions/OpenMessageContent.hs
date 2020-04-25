-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenMessageContent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data OpenMessageContent = 
 OpenMessageContent { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON OpenMessageContent where
 toJSON (OpenMessageContent { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "openMessageContent", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON OpenMessageContent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "openMessageContent" -> parseOpenMessageContent v
   _ -> mempty
  where
   parseOpenMessageContent :: A.Value -> T.Parser OpenMessageContent
   parseOpenMessageContent = A.withObject "OpenMessageContent" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OpenMessageContent { message_id = message_id, chat_id = chat_id }