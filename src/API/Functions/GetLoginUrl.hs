-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLoginUrl where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLoginUrl = 
 GetLoginUrl { allow_write_access :: Maybe Bool, button_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetLoginUrl where
 toJSON (GetLoginUrl { allow_write_access = allow_write_access, button_id = button_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getLoginUrl", "allow_write_access" A..= allow_write_access, "button_id" A..= button_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetLoginUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLoginUrl" -> parseGetLoginUrl v
   _ -> mempty
  where
   parseGetLoginUrl :: A.Value -> T.Parser GetLoginUrl
   parseGetLoginUrl = A.withObject "GetLoginUrl" $ \o -> do
    allow_write_access <- optional $ o A..: "allow_write_access"
    button_id <- optional $ o A..: "button_id"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetLoginUrl { allow_write_access = allow_write_access, button_id = button_id, message_id = message_id, chat_id = chat_id }