-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCommands where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommand as BotCommand

-- |
-- 
-- Sets the list of commands supported by the bot; for bots only 
-- 
-- __commands__ List of the bot's commands
data SetCommands = 

 SetCommands { commands :: Maybe [BotCommand.BotCommand] }  deriving (Show, Eq)

instance T.ToJSON SetCommands where
 toJSON (SetCommands { commands = commands }) =
  A.object [ "@type" A..= T.String "setCommands", "commands" A..= commands ]

instance T.FromJSON SetCommands where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setCommands" -> parseSetCommands v
   _ -> mempty
  where
   parseSetCommands :: A.Value -> T.Parser SetCommands
   parseSetCommands = A.withObject "SetCommands" $ \o -> do
    commands <- o A..:? "commands"
    return $ SetCommands { commands = commands }