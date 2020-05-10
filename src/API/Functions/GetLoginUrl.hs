-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLoginUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns an HTTP URL which can be used to automatically authorize the user on a website after clicking an inline button of type inlineKeyboardButtonTypeLoginUrl.
-- 
-- -Use the method getLoginUrlInfo to find whether a prior user confirmation is needed. If an error is returned, then the button must be handled as an ordinary URL button
-- 
-- __chat_id__ Chat identifier of the message with the button
-- 
-- __message_id__ Message identifier of the message with the button
-- 
-- __button_id__ Button identifier
-- 
-- __allow_write_access__ True, if the user allowed the bot to send them messages
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
    allow_write_access <- o A..:? "allow_write_access"
    button_id <- mconcat [ o A..:? "button_id", readMaybe <$> (o A..: "button_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetLoginUrl { allow_write_access = allow_write_access, button_id = button_id, message_id = message_id, chat_id = chat_id }