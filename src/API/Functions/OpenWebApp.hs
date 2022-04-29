-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenWebApp where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ThemeParameters as ThemeParameters

-- |
-- 
-- Informs TDLib that a web app is being opened from attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button.
-- 
-- -For each bot, a confirmation alert about data sent to the bot must be shown once
-- 
-- __chat_id__ Identifier of the chat in which the web app is opened. Web apps can be opened only in private chats for now
-- 
-- __bot_user_id__ Identifier of the bot, providing the web app
-- 
-- __url__ The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, or an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
-- 
-- __theme__ Preferred web app theme; pass null to use the default theme
-- 
-- __reply_to_message_id__ Identifier of the replied message for the message sent by the web app; 0 if none
data OpenWebApp = 

 OpenWebApp { reply_to_message_id :: Maybe Int, theme :: Maybe ThemeParameters.ThemeParameters, url :: Maybe String, bot_user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show OpenWebApp where
 show OpenWebApp { reply_to_message_id=reply_to_message_id, theme=theme, url=url, bot_user_id=bot_user_id, chat_id=chat_id } =
  "OpenWebApp" ++ cc [p "reply_to_message_id" reply_to_message_id, p "theme" theme, p "url" url, p "bot_user_id" bot_user_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON OpenWebApp where
 toJSON OpenWebApp { reply_to_message_id = reply_to_message_id, theme = theme, url = url, bot_user_id = bot_user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "openWebApp", "reply_to_message_id" A..= reply_to_message_id, "theme" A..= theme, "url" A..= url, "bot_user_id" A..= bot_user_id, "chat_id" A..= chat_id ]

instance T.FromJSON OpenWebApp where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "openWebApp" -> parseOpenWebApp v
   _ -> mempty
  where
   parseOpenWebApp :: A.Value -> T.Parser OpenWebApp
   parseOpenWebApp = A.withObject "OpenWebApp" $ \o -> do
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    theme <- o A..:? "theme"
    url <- o A..:? "url"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OpenWebApp { reply_to_message_id = reply_to_message_id, theme = theme, url = url, bot_user_id = bot_user_id, chat_id = chat_id }
 parseJSON _ = mempty
