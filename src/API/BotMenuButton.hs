-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotMenuButton where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes a button to be shown instead of bot commands menu button 
-- 
-- __text__ Text of the button
-- 
-- __url__ URL to be passed to openWebApp
data BotMenuButton = 

 BotMenuButton { url :: Maybe String, text :: Maybe String }  deriving (Eq)

instance Show BotMenuButton where
 show BotMenuButton { url=url, text=text } =
  "BotMenuButton" ++ U.cc [U.p "url" url, U.p "text" text ]

instance T.ToJSON BotMenuButton where
 toJSON BotMenuButton { url = url, text = text } =
  A.object [ "@type" A..= T.String "botMenuButton", "url" A..= url, "text" A..= text ]

instance T.FromJSON BotMenuButton where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "botMenuButton" -> parseBotMenuButton v
   _ -> mempty
  where
   parseBotMenuButton :: A.Value -> T.Parser BotMenuButton
   parseBotMenuButton = A.withObject "BotMenuButton" $ \o -> do
    url <- o A..:? "url"
    text <- o A..:? "text"
    return $ BotMenuButton { url = url, text = text }
 parseJSON _ = mempty
