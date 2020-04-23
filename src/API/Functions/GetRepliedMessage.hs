-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRepliedMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetRepliedMessage = 
 GetRepliedMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

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
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetRepliedMessage { message_id = message_id, chat_id = chat_id }