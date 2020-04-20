-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsite where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ConnectedWebsite = 
 ConnectedWebsite { location :: String, ip :: String, last_active_date :: Int, log_in_date :: Int, platform :: String, browser :: String, bot_user_id :: Int, domain_name :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON ConnectedWebsite where
 toJSON (ConnectedWebsite { location = location, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, platform = platform, browser = browser, bot_user_id = bot_user_id, domain_name = domain_name, _id = _id }) =
  A.object [ "@type" A..= T.String "connectedWebsite", "location" A..= location, "ip" A..= ip, "last_active_date" A..= last_active_date, "log_in_date" A..= log_in_date, "platform" A..= platform, "browser" A..= browser, "bot_user_id" A..= bot_user_id, "domain_name" A..= domain_name, "id" A..= _id ]
-- connectedWebsite ConnectedWebsite  { location :: String, ip :: String, last_active_date :: Int, log_in_date :: Int, platform :: String, browser :: String, bot_user_id :: Int, domain_name :: String, _id :: Int } 

