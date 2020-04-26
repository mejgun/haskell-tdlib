-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLoginUrlInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button
-- 
-- __chat_id__ Chat identifier of the message with the button
-- 
-- __message_id__ Message identifier of the message with the button
-- 
-- __button_id__ Button identifier
data GetLoginUrlInfo = 
 GetLoginUrlInfo { button_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    button_id <- mconcat [ o A..:? "button_id", readMaybe <$> (o A..: "button_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetLoginUrlInfo { button_id = button_id, message_id = message_id, chat_id = chat_id }