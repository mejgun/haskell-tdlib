module TD.Data.LoginUrlInfo
  (LoginUrlInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl
data LoginUrlInfo
  = LoginUrlInfoOpen -- ^ An HTTP URL needs to be open
    { url               :: Maybe T.Text -- ^ The URL to open
    , skip_confirmation :: Maybe Bool   -- ^ True, if there is no need to show an ordinary open URL confirmation
    }
  | LoginUrlInfoRequestConfirmation -- ^ An authorization confirmation dialog needs to be shown to the user
    { url                         :: Maybe T.Text -- ^ An HTTP URL to be opened
    , domain                      :: Maybe T.Text -- ^ A domain of the URL
    , bot_user_id                 :: Maybe Int    -- ^ User identifier of a bot linked with the website
    , request_write_access        :: Maybe Bool   -- ^ True, if the user must be asked for the permission to the bot to send them messages
    , request_phone_number_access :: Maybe Bool   -- ^ True, if the user must be asked for the permission to share their phone number
    , browser                     :: Maybe T.Text -- ^ The version of a browser used for the authorization; may be empty if irrelevant
    , platform                    :: Maybe T.Text -- ^ Operating system the browser is running on; may be empty if irrelevant
    , ip_address                  :: Maybe T.Text -- ^ IP address from which the authorization is performed, in human-readable format; may be empty if irrelevant
    , location                    :: Maybe T.Text -- ^ Human-readable description of a country and a region from which the authorization is performed, based on the IP address; may be empty if irrelevant
    }
  deriving (Eq, Show)

instance I.ShortShow LoginUrlInfo where
  shortShow LoginUrlInfoOpen
    { url               = url_
    , skip_confirmation = skip_confirmation_
    }
      = "LoginUrlInfoOpen"
        ++ I.cc
        [ "url"               `I.p` url_
        , "skip_confirmation" `I.p` skip_confirmation_
        ]
  shortShow LoginUrlInfoRequestConfirmation
    { url                         = url_
    , domain                      = domain_
    , bot_user_id                 = bot_user_id_
    , request_write_access        = request_write_access_
    , request_phone_number_access = request_phone_number_access_
    , browser                     = browser_
    , platform                    = platform_
    , ip_address                  = ip_address_
    , location                    = location_
    }
      = "LoginUrlInfoRequestConfirmation"
        ++ I.cc
        [ "url"                         `I.p` url_
        , "domain"                      `I.p` domain_
        , "bot_user_id"                 `I.p` bot_user_id_
        , "request_write_access"        `I.p` request_write_access_
        , "request_phone_number_access" `I.p` request_phone_number_access_
        , "browser"                     `I.p` browser_
        , "platform"                    `I.p` platform_
        , "ip_address"                  `I.p` ip_address_
        , "location"                    `I.p` location_
        ]

instance AT.FromJSON LoginUrlInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "loginUrlInfoOpen"                -> parseLoginUrlInfoOpen v
      "loginUrlInfoRequestConfirmation" -> parseLoginUrlInfoRequestConfirmation v
      _                                 -> mempty
    
    where
      parseLoginUrlInfoOpen :: A.Value -> AT.Parser LoginUrlInfo
      parseLoginUrlInfoOpen = A.withObject "LoginUrlInfoOpen" $ \o -> do
        url_               <- o A..:?  "url"
        skip_confirmation_ <- o A..:?  "skip_confirmation"
        pure $ LoginUrlInfoOpen
          { url               = url_
          , skip_confirmation = skip_confirmation_
          }
      parseLoginUrlInfoRequestConfirmation :: A.Value -> AT.Parser LoginUrlInfo
      parseLoginUrlInfoRequestConfirmation = A.withObject "LoginUrlInfoRequestConfirmation" $ \o -> do
        url_                         <- o A..:?  "url"
        domain_                      <- o A..:?  "domain"
        bot_user_id_                 <- o A..:?  "bot_user_id"
        request_write_access_        <- o A..:?  "request_write_access"
        request_phone_number_access_ <- o A..:?  "request_phone_number_access"
        browser_                     <- o A..:?  "browser"
        platform_                    <- o A..:?  "platform"
        ip_address_                  <- o A..:?  "ip_address"
        location_                    <- o A..:?  "location"
        pure $ LoginUrlInfoRequestConfirmation
          { url                         = url_
          , domain                      = domain_
          , bot_user_id                 = bot_user_id_
          , request_write_access        = request_write_access_
          , request_phone_number_access = request_phone_number_access_
          , browser                     = browser_
          , platform                    = platform_
          , ip_address                  = ip_address_
          , location                    = location_
          }
  parseJSON _ = mempty

