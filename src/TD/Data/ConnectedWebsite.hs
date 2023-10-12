module TD.Data.ConnectedWebsite where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ConnectedWebsite
  = ConnectedWebsite -- ^ Contains information about one website the current user is logged in with Telegram
    { _id              :: Maybe Int    -- ^ Website identifier
    , domain_name      :: Maybe T.Text -- ^ The domain name of the website
    , bot_user_id      :: Maybe Int    -- ^ User identifier of a bot linked with the website
    , browser          :: Maybe T.Text -- ^ The version of a browser used to log in
    , platform         :: Maybe T.Text -- ^ Operating system the browser is running on
    , log_in_date      :: Maybe Int    -- ^ Point in time (Unix timestamp) when the user was logged in
    , last_active_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when obtained authorization was last used
    , ip               :: Maybe T.Text -- ^ IP address from which the user was logged in, in human-readable format
    , location         :: Maybe T.Text -- ^ Human-readable description of a country and a region from which the user was logged in, based on the IP address
    }
  deriving (Eq)

instance Show ConnectedWebsite where
  show ConnectedWebsite
    { _id              = _id_
    , domain_name      = domain_name_
    , bot_user_id      = bot_user_id_
    , browser          = browser_
    , platform         = platform_
    , log_in_date      = log_in_date_
    , last_active_date = last_active_date_
    , ip               = ip_
    , location         = location_
    }
      = "ConnectedWebsite"
        ++ I.cc
        [ "_id"              `I.p` _id_
        , "domain_name"      `I.p` domain_name_
        , "bot_user_id"      `I.p` bot_user_id_
        , "browser"          `I.p` browser_
        , "platform"         `I.p` platform_
        , "log_in_date"      `I.p` log_in_date_
        , "last_active_date" `I.p` last_active_date_
        , "ip"               `I.p` ip_
        , "location"         `I.p` location_
        ]

instance AT.FromJSON ConnectedWebsite where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "connectedWebsite" -> parseConnectedWebsite v
      _                  -> mempty
    
    where
      parseConnectedWebsite :: A.Value -> AT.Parser ConnectedWebsite
      parseConnectedWebsite = A.withObject "ConnectedWebsite" $ \o -> do
        _id_              <- fmap I.readInt64 <$> o A..:?  "id"
        domain_name_      <- o A..:?                       "domain_name"
        bot_user_id_      <- o A..:?                       "bot_user_id"
        browser_          <- o A..:?                       "browser"
        platform_         <- o A..:?                       "platform"
        log_in_date_      <- o A..:?                       "log_in_date"
        last_active_date_ <- o A..:?                       "last_active_date"
        ip_               <- o A..:?                       "ip"
        location_         <- o A..:?                       "location"
        pure $ ConnectedWebsite
          { _id              = _id_
          , domain_name      = domain_name_
          , bot_user_id      = bot_user_id_
          , browser          = browser_
          , platform         = platform_
          , log_in_date      = log_in_date_
          , last_active_date = last_active_date_
          , ip               = ip_
          , location         = location_
          }

instance AT.ToJSON ConnectedWebsite where
  toJSON ConnectedWebsite
    { _id              = _id_
    , domain_name      = domain_name_
    , bot_user_id      = bot_user_id_
    , browser          = browser_
    , platform         = platform_
    , log_in_date      = log_in_date_
    , last_active_date = last_active_date_
    , ip               = ip_
    , location         = location_
    }
      = A.object
        [ "@type"            A..= AT.String "connectedWebsite"
        , "id"               A..= fmap I.writeInt64  _id_
        , "domain_name"      A..= domain_name_
        , "bot_user_id"      A..= bot_user_id_
        , "browser"          A..= browser_
        , "platform"         A..= platform_
        , "log_in_date"      A..= log_in_date_
        , "last_active_date" A..= last_active_date_
        , "ip"               A..= ip_
        , "location"         A..= location_
        ]
