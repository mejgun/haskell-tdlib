-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRepliedMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetRepliedMessage = 
 GetRepliedMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetRepliedMessage where
 toJSON (GetRepliedMessage { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getRepliedMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetRepliedMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRepliedMessage" -> parseGetRepliedMessage v
   _ -> mempty
  where
   parseGetRepliedMessage :: A.Value -> T.Parser GetRepliedMessage
   parseGetRepliedMessage = A.withObject "GetRepliedMessage" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetRepliedMessage { message_id = message_id, chat_id = chat_id }