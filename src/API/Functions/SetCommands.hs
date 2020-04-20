-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCommands where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommand as BotCommand

--main = putStrLn "ok"

data SetCommands = 
 SetCommands { commands :: [BotCommand.BotCommand] }  -- deriving (Show)

instance T.ToJSON SetCommands where
 toJSON (SetCommands { commands = commands }) =
  A.object [ "@type" A..= T.String "setCommands", "commands" A..= commands ]
-- setCommands SetCommands  { commands :: [BotCommand.BotCommand] } 

