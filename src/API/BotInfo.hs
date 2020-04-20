-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommand as BotCommand

--main = putStrLn "ok"

data BotInfo = 
 BotInfo { commands :: [BotCommand.BotCommand], description :: String }  -- deriving (Show)

instance T.ToJSON BotInfo where
 toJSON (BotInfo { commands = commands, description = description }) =
  A.object [ "@type" A..= T.String "botInfo", "commands" A..= commands, "description" A..= description ]
-- botInfo BotInfo  { commands :: [BotCommand.BotCommand], description :: String } 

