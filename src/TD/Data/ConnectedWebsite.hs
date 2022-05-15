{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ConnectedWebsite where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ConnectedWebsite = -- | Contains information about one website the current user is logged in with Telegram
  ConnectedWebsite
  { -- | Human-readable description of a country and a region from which the user was logged in, based on the IP address
    location :: Maybe String,
    -- | IP address from which the user was logged in, in human-readable format
    ip :: Maybe String,
    -- | Point in time (Unix timestamp) when obtained authorization was last used
    last_active_date :: Maybe Int,
    -- | Point in time (Unix timestamp) when the user was logged in
    log_in_date :: Maybe Int,
    -- | Operating system the browser is running on
    platform :: Maybe String,
    -- | The version of a browser used to log in
    browser :: Maybe String,
    -- | User identifier of a bot linked with the website
    bot_user_id :: Maybe Int,
    -- | The domain name of the website
    domain_name :: Maybe String,
    -- | Website identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show ConnectedWebsite where
  show
    ConnectedWebsite
      { location = location_,
        ip = ip_,
        last_active_date = last_active_date_,
        log_in_date = log_in_date_,
        platform = platform_,
        browser = browser_,
        bot_user_id = bot_user_id_,
        domain_name = domain_name_,
        _id = _id_
      } =
      "ConnectedWebsite"
        ++ U.cc
          [ U.p "location" location_,
            U.p "ip" ip_,
            U.p "last_active_date" last_active_date_,
            U.p "log_in_date" log_in_date_,
            U.p "platform" platform_,
            U.p "browser" browser_,
            U.p "bot_user_id" bot_user_id_,
            U.p "domain_name" domain_name_,
            U.p "_id" _id_
          ]

instance T.FromJSON ConnectedWebsite where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "connectedWebsite" -> parseConnectedWebsite v
      _ -> mempty
    where
      parseConnectedWebsite :: A.Value -> T.Parser ConnectedWebsite
      parseConnectedWebsite = A.withObject "ConnectedWebsite" $ \o -> do
        location_ <- o A..:? "location"
        ip_ <- o A..:? "ip"
        last_active_date_ <- o A..:? "last_active_date"
        log_in_date_ <- o A..:? "log_in_date"
        platform_ <- o A..:? "platform"
        browser_ <- o A..:? "browser"
        bot_user_id_ <- o A..:? "bot_user_id"
        domain_name_ <- o A..:? "domain_name"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ConnectedWebsite {location = location_, ip = ip_, last_active_date = last_active_date_, log_in_date = log_in_date_, platform = platform_, browser = browser_, bot_user_id = bot_user_id_, domain_name = domain_name_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ConnectedWebsite where
  toJSON
    ConnectedWebsite
      { location = location_,
        ip = ip_,
        last_active_date = last_active_date_,
        log_in_date = log_in_date_,
        platform = platform_,
        browser = browser_,
        bot_user_id = bot_user_id_,
        domain_name = domain_name_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "connectedWebsite",
          "location" A..= location_,
          "ip" A..= ip_,
          "last_active_date" A..= last_active_date_,
          "log_in_date" A..= log_in_date_,
          "platform" A..= platform_,
          "browser" A..= browser_,
          "bot_user_id" A..= bot_user_id_,
          "domain_name" A..= domain_name_,
          "id" A..= U.toS _id_
        ]
