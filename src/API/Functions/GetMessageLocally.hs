-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLocally where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a message, if it is available locally without sending network request. This is an offline request 
-- 
-- __chat_id__ Identifier of the chat the message belongs to
-- 
-- __message_id__ Identifier of the message to get
data GetMessageLocally = 

 GetMessageLocally { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageLocally { message_id = message_id, chat_id = chat_id }