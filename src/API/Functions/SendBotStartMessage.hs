-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendBotStartMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SendBotStartMessage = 
 SendBotStartMessage { parameter :: Maybe String, chat_id :: Maybe Int, bot_user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendBotStartMessage where
 toJSON (SendBotStartMessage { parameter = parameter, chat_id = chat_id, bot_user_id = bot_user_id }) =
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
    parameter <- optional $ o A..: "parameter"
    chat_id <- optional $ o A..: "chat_id"
    bot_user_id <- optional $ o A..: "bot_user_id"
    return $ SendBotStartMessage { parameter = parameter, chat_id = chat_id, bot_user_id = bot_user_id }