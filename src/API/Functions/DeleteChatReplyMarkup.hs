-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatReplyMarkup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteChatReplyMarkup = 
 DeleteChatReplyMarkup { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON DeleteChatReplyMarkup where
 toJSON (DeleteChatReplyMarkup { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteChatReplyMarkup", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChatReplyMarkup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatReplyMarkup" -> parseDeleteChatReplyMarkup v
   _ -> mempty
  where
   parseDeleteChatReplyMarkup :: A.Value -> T.Parser DeleteChatReplyMarkup
   parseDeleteChatReplyMarkup = A.withObject "DeleteChatReplyMarkup" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ DeleteChatReplyMarkup { message_id = message_id, chat_id = chat_id }