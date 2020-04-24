-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCallbackQueryAnswer where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallbackQueryPayload as CallbackQueryPayload

data GetCallbackQueryAnswer = 
 GetCallbackQueryAnswer { payload :: Maybe CallbackQueryPayload.CallbackQueryPayload, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetCallbackQueryAnswer where
 toJSON (GetCallbackQueryAnswer { payload = payload, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getCallbackQueryAnswer", "payload" A..= payload, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetCallbackQueryAnswer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCallbackQueryAnswer" -> parseGetCallbackQueryAnswer v
   _ -> mempty
  where
   parseGetCallbackQueryAnswer :: A.Value -> T.Parser GetCallbackQueryAnswer
   parseGetCallbackQueryAnswer = A.withObject "GetCallbackQueryAnswer" $ \o -> do
    payload <- optional $ o A..: "payload"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetCallbackQueryAnswer { payload = payload, message_id = message_id, chat_id = chat_id }