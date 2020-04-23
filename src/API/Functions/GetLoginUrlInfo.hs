-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLoginUrlInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLoginUrlInfo = 
 GetLoginUrlInfo { button_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetLoginUrlInfo where
 toJSON (GetLoginUrlInfo { button_id = button_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getLoginUrlInfo", "button_id" A..= button_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetLoginUrlInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLoginUrlInfo" -> parseGetLoginUrlInfo v
   _ -> mempty
  where
   parseGetLoginUrlInfo :: A.Value -> T.Parser GetLoginUrlInfo
   parseGetLoginUrlInfo = A.withObject "GetLoginUrlInfo" $ \o -> do
    button_id <- optional $ o A..: "button_id"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetLoginUrlInfo { button_id = button_id, message_id = message_id, chat_id = chat_id }