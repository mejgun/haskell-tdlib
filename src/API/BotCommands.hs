-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotCommands where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.BotCommand as BotCommand

-- |
-- 
-- Contains a list of bot commands 
-- 
-- __bot_user_id__ Bot's user identifier
-- 
-- __commands__ List of bot commands
data BotCommands = 

 BotCommands { commands :: Maybe [BotCommand.BotCommand], bot_user_id :: Maybe Int }  deriving (Eq)

instance Show BotCommands where
 show BotCommands { commands=commands, bot_user_id=bot_user_id } =
  "BotCommands" ++ U.cc [U.p "commands" commands, U.p "bot_user_id" bot_user_id ]

instance T.ToJSON BotCommands where
 toJSON BotCommands { commands = commands, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "botCommands", "commands" A..= commands, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON BotCommands where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "botCommands" -> parseBotCommands v
   _ -> mempty
  where
   parseBotCommands :: A.Value -> T.Parser BotCommands
   parseBotCommands = A.withObject "BotCommands" $ \o -> do
    commands <- o A..:? "commands"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BotCommands { commands = commands, bot_user_id = bot_user_id }
 parseJSON _ = mempty
