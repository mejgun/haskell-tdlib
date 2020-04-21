-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsite where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ConnectedWebsite = 
 ConnectedWebsite { location :: String, ip :: String, last_active_date :: Int, log_in_date :: Int, platform :: String, browser :: String, bot_user_id :: Int, domain_name :: String, _id :: Int }  deriving (Show)

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
    location <- o A..: "location"
    ip <- o A..: "ip"
    last_active_date <- o A..: "last_active_date"
    log_in_date <- o A..: "log_in_date"
    platform <- o A..: "platform"
    browser <- o A..: "browser"
    bot_user_id <- o A..: "bot_user_id"
    domain_name <- o A..: "domain_name"
    _id <- o A..: "id"
    return $ ConnectedWebsite { location = location, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, platform = platform, browser = browser, bot_user_id = bot_user_id, domain_name = domain_name, _id = _id }