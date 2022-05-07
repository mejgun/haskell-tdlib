{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ConnectedWebsite where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { location = location,
        ip = ip,
        last_active_date = last_active_date,
        log_in_date = log_in_date,
        platform = platform,
        browser = browser,
        bot_user_id = bot_user_id,
        domain_name = domain_name,
        _id = _id
      } =
      "ConnectedWebsite"
        ++ U.cc
          [ U.p "location" location,
            U.p "ip" ip,
            U.p "last_active_date" last_active_date,
            U.p "log_in_date" log_in_date,
            U.p "platform" platform,
            U.p "browser" browser,
            U.p "bot_user_id" bot_user_id,
            U.p "domain_name" domain_name,
            U.p "_id" _id
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
        last_active_date_ <- mconcat [o A..:? "last_active_date", U.rm <$> (o A..: "last_active_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        log_in_date_ <- mconcat [o A..:? "log_in_date", U.rm <$> (o A..: "log_in_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        platform_ <- o A..:? "platform"
        browser_ <- o A..:? "browser"
        bot_user_id_ <- mconcat [o A..:? "bot_user_id", U.rm <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        domain_name_ <- o A..:? "domain_name"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ConnectedWebsite {location = location_, ip = ip_, last_active_date = last_active_date_, log_in_date = log_in_date_, platform = platform_, browser = browser_, bot_user_id = bot_user_id_, domain_name = domain_name_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ConnectedWebsite where
  toJSON
    ConnectedWebsite
      { location = location,
        ip = ip,
        last_active_date = last_active_date,
        log_in_date = log_in_date,
        platform = platform,
        browser = browser,
        bot_user_id = bot_user_id,
        domain_name = domain_name,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "connectedWebsite",
          "location" A..= location,
          "ip" A..= ip,
          "last_active_date" A..= last_active_date,
          "log_in_date" A..= log_in_date,
          "platform" A..= platform,
          "browser" A..= browser,
          "bot_user_id" A..= bot_user_id,
          "domain_name" A..= domain_name,
          "id" A..= _id
        ]
