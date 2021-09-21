-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatTheme where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the chat theme. Supported only in private and secret chats 
-- 
-- __chat_id__ Chat identifier
-- 
-- __theme_name__ Name of the new chat theme; may be empty to return the default theme
data SetChatTheme = 

 SetChatTheme { theme_name :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatTheme where
 toJSON (SetChatTheme { theme_name = theme_name, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatTheme", "theme_name" A..= theme_name, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatTheme where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatTheme" -> parseSetChatTheme v
   _ -> mempty
  where
   parseSetChatTheme :: A.Value -> T.Parser SetChatTheme
   parseSetChatTheme = A.withObject "SetChatTheme" $ \o -> do
    theme_name <- o A..:? "theme_name"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatTheme { theme_name = theme_name, chat_id = chat_id }