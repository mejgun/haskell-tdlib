-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommand as BotCommand

data BotInfo = 
 BotInfo { commands :: Maybe [BotCommand.BotCommand], description :: Maybe String }  deriving (Show)

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
    commands <- optional $ o A..: "commands"
    description <- optional $ o A..: "description"
    return $ BotInfo { commands = commands, description = description }