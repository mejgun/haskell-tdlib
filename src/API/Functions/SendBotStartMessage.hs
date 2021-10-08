-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendBotStartMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message
-- 
-- __bot_user_id__ Identifier of the bot
-- 
-- __chat_id__ Identifier of the target chat
-- 
-- __parameter__ A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
data SendBotStartMessage = 

 SendBotStartMessage { parameter :: Maybe String, chat_id :: Maybe Int, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show SendBotStartMessage where
 show SendBotStartMessage { parameter=parameter, chat_id=chat_id, bot_user_id=bot_user_id } =
  "SendBotStartMessage" ++ cc [p "parameter" parameter, p "chat_id" chat_id, p "bot_user_id" bot_user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendBotStartMessage where
 toJSON SendBotStartMessage { parameter = parameter, chat_id = chat_id, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "sendBotStartMessage", "parameter" A..= parameter, "chat_id" A..= chat_id, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON SendBotStartMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendBotStartMessage" -> parseSendBotStartMessage v
   _ -> mempty
  where
   parseSendBotStartMessage :: A.Value -> T.Parser SendBotStartMessage
   parseSendBotStartMessage = A.withObject "SendBotStartMessage" $ \o -> do
    parameter <- o A..:? "parameter"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendBotStartMessage { parameter = parameter, chat_id = chat_id, bot_user_id = bot_user_id }
 parseJSON _ = mempty
