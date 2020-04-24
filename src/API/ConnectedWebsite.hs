-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsite where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    location <- optional $ o A..: "location"
    ip <- optional $ o A..: "ip"
    last_active_date <- optional $ o A..: "last_active_date"
    log_in_date <- optional $ o A..: "log_in_date"
    platform <- optional $ o A..: "platform"
    browser <- optional $ o A..: "browser"
    bot_user_id <- optional $ o A..: "bot_user_id"
    domain_name <- optional $ o A..: "domain_name"
    _id <- optional $ o A..: "id"
    return $ ConnectedWebsite { location = location, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, platform = platform, browser = browser, bot_user_id = bot_user_id, domain_name = domain_name, _id = _id }