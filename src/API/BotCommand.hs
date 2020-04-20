-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotCommand where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data BotCommand = 
 BotCommand { description :: String, command :: String }  -- deriving (Show)

instance T.ToJSON BotCommand where
 toJSON (BotCommand { description = description, command = command }) =
  A.object [ "@type" A..= T.String "botCommand", "description" A..= description, "command" A..= command ]
-- botCommand BotCommand  { description :: String, command :: String } 

