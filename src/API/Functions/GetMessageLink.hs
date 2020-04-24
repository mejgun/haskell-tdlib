-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLink where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetMessageLink = 
 GetMessageLink { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetMessageLink { message_id = message_id, chat_id = chat_id }