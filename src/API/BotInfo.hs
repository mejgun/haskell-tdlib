-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommand as BotCommand

-- |
-- 
-- Provides information about a bot and its supported commands 
-- 
-- __param_description__ Long description shown on the user info page
-- 
-- __commands__ A list of commands supported by the bot
data BotInfo = 

 BotInfo { commands :: Maybe [BotCommand.BotCommand], description :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON BotInfo where
 toJSON (BotInfo { commands = commands, description = description }) =
  A.object [ "@type" A..= T.String "botInfo", "commands" A..= commands, "description" A..= description ]

instance T.FromJSON BotInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "botInfo" -> parseBotInfo v
   _ -> mempty
  where
   parseBotInfo :: A.Value -> T.Parser BotInfo
   parseBotInfo = A.withObject "BotInfo" $ \o -> do
    commands <- o A..:? "commands"
    description <- o A..:? "description"
    return $ BotInfo { commands = commands, description = description }