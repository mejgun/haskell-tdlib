-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLocally where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetMessageLocally = 
 GetMessageLocally { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetMessageLocally where
 toJSON (GetMessageLocally { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageLocally", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageLocally where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageLocally" -> parseGetMessageLocally v
   _ -> mempty
  where
   parseGetMessageLocally :: A.Value -> T.Parser GetMessageLocally
   parseGetMessageLocally = A.withObject "GetMessageLocally" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetMessageLocally { message_id = message_id, chat_id = chat_id }