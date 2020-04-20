-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendBotStartMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendBotStartMessage = 
 SendBotStartMessage { parameter :: String, chat_id :: Int, bot_user_id :: Int }  -- deriving (Show)

instance T.ToJSON SendBotStartMessage where
 toJSON (SendBotStartMessage { parameter = parameter, chat_id = chat_id, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "sendBotStartMessage", "parameter" A..= parameter, "chat_id" A..= chat_id, "bot_user_id" A..= bot_user_id ]
-- sendBotStartMessage SendBotStartMessage  { parameter :: String, chat_id :: Int, bot_user_id :: Int } 



instance T.FromJSON SendBotStartMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendBotStartMessage" -> parseSendBotStartMessage v
  where
   parseSendBotStartMessage :: A.Value -> T.Parser SendBotStartMessage
   parseSendBotStartMessage = A.withObject "SendBotStartMessage" $ \o -> do
    parameter <- o A..: "parameter"
    chat_id <- o A..: "chat_id"
    bot_user_id <- o A..: "bot_user_id"
    return $ SendBotStartMessage { parameter = parameter, chat_id = chat_id, bot_user_id = bot_user_id }