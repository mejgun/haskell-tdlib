-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotCommand where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a command supported by a bot 
-- 
-- __command__ Text of the bot command
-- 
-- __param_description__ Description of the bot command
data BotCommand = 

 BotCommand { description :: Maybe String, command :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON BotCommand where
 toJSON (BotCommand { description = description, command = command }) =
  A.object [ "@type" A..= T.String "botCommand", "description" A..= description, "command" A..= command ]

instance T.FromJSON BotCommand where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "botCommand" -> parseBotCommand v
   _ -> mempty
  where
   parseBotCommand :: A.Value -> T.Parser BotCommand
   parseBotCommand = A.withObject "BotCommand" $ \o -> do
    description <- o A..:? "description"
    command <- o A..:? "command"
    return $ BotCommand { description = description, command = command }