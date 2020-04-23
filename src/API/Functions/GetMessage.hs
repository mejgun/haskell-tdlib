-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetMessage = 
 GetMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetMessage where
 toJSON (GetMessage { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessage" -> parseGetMessage v
   _ -> mempty
  where
   parseGetMessage :: A.Value -> T.Parser GetMessage
   parseGetMessage = A.withObject "GetMessage" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetMessage { message_id = message_id, chat_id = chat_id }