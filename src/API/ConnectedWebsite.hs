-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsite where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about one website the current user is logged in with Telegram
-- 
-- __id__ Website identifier
-- 
-- __domain_name__ The domain name of the website
-- 
-- __bot_user_id__ User identifier of a bot linked with the website
-- 
-- __browser__ The version of a browser used to log in
-- 
-- __platform__ Operating system the browser is running on
-- 
-- __log_in_date__ Point in time (Unix timestamp) when the user was logged in
-- 
-- __last_active_date__ Point in time (Unix timestamp) when obtained authorization was last used
-- 
-- __ip__ IP address from which the user was logged in, in human-readable format
-- 
-- __location__ Human-readable description of a country and a region, from which the user was logged in, based on the IP address
data ConnectedWebsite = 

 ConnectedWebsite { location :: Maybe String, ip :: Maybe String, last_active_date :: Maybe Int, log_in_date :: Maybe Int, platform :: Maybe String, browser :: Maybe String, bot_user_id :: Maybe Int, domain_name :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ConnectedWebsite where
 toJSON (ConnectedWebsite { location = location, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, platform = platform, browser = browser, bot_user_id = bot_user_id, domain_name = domain_name, _id = _id }) =
  A.object [ "@type" A..= T.String "connectedWebsite", "location" A..= location, "ip" A..= ip, "last_active_date" A..= last_active_date, "log_in_date" A..= log_in_date, "platform" A..= platform, "browser" A..= browser, "bot_user_id" A..= bot_user_id, "domain_name" A..= domain_name, "id" A..= _id ]

instance T.FromJSON ConnectedWebsite where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "connectedWebsite" -> parseConnectedWebsite v
   _ -> mempty
  where
   parseConnectedWebsite :: A.Value -> T.Parser ConnectedWebsite
   parseConnectedWebsite = A.withObject "ConnectedWebsite" $ \o -> do
    location <- o A..:? "location"
    ip <- o A..:? "ip"
    last_active_date <- mconcat [ o A..:? "last_active_date", readMaybe <$> (o A..: "last_active_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    log_in_date <- mconcat [ o A..:? "log_in_date", readMaybe <$> (o A..: "log_in_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    platform <- o A..:? "platform"
    browser <- o A..:? "browser"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    domain_name <- o A..:? "domain_name"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ConnectedWebsite { location = location, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, platform = platform, browser = browser, bot_user_id = bot_user_id, domain_name = domain_name, _id = _id }