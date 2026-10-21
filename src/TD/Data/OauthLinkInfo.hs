module TD.Data.OauthLinkInfo
  (OauthLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data OauthLinkInfo
  = OauthLinkInfo -- ^ Information about the OAuth authorization
    { user_id                     :: Maybe Int      -- ^ Identifier of the user for which the link was generated; may be 0 if unknown. The corresponding user may be unknown. If the user is logged in the application, then they must be chosen for authorization by default
    , url                         :: Maybe T.Text   -- ^ An HTTP URL where the user authorizes
    , domain                      :: Maybe T.Text   -- ^ A domain of the URL
    , from_app                    :: Maybe Bool     -- ^ True, if the authorization originates from an application
    , verified_app_name           :: Maybe T.Text   -- ^ Verified name of the application; if empty, then "Unverified App" must be shown instead
    , bot_user_id                 :: Maybe Int      -- ^ User identifier of a bot linked with the website
    , request_write_access        :: Maybe Bool     -- ^ True, if the user must be asked for the permission to the bot to send them messages
    , request_phone_number_access :: Maybe Bool     -- ^ True, if the user must be asked for the permission to share their phone number
    , request_ton_wallet_access   :: Maybe Bool     -- ^ True, if access to the user's TON wallet is requested by the app. If true and the user agrees to give access, then use createTonConnectSession with dapp_client_id and ton_connect_manifest_url to create the TON Connect session, then setTonConnectSessionWalletClientId, then create a tonWalletOwnershipProof for the given domain with the payload ton_proof_payload, and then pass all data to acceptOauthRequest in the parameter ton_connect_connect_data
    , dapp_client_id              :: Maybe T.Text   -- ^ Hex-encoded public X25519 key of the dApp; may be empty if TON wallet access wasn't requested
    , ton_connect_manifest_url    :: Maybe T.Text   -- ^ URL of the TON Connect manifest of the dApp; may be empty if TON wallet access wasn't requested
    , ton_proof_payload           :: Maybe T.Text   -- ^ Payload for TON wallet ownership proof; may be empty if TON wallet access wasn't requested
    , browser                     :: Maybe T.Text   -- ^ The version of a browser used for the authorization
    , platform                    :: Maybe T.Text   -- ^ Operating system the browser is running on
    , ip_address                  :: Maybe T.Text   -- ^ IP address from which the authorization is performed, in human-readable format
    , location                    :: Maybe T.Text   -- ^ Human-readable description of a country and a region from which the authorization is performed, based on the IP address
    , match_code_first            :: Maybe Bool     -- ^ True, if code matching dialog must be shown first and checkOauthRequestMatchCode must be called before acceptOauthRequest. Otherwise, checkOauthRequestMatchCode must not be called
    , match_codes                 :: Maybe [T.Text] -- ^ The list of codes to match; may be empty if irrelevant
    }
  deriving (Eq, Show)

instance I.ShortShow OauthLinkInfo where
  shortShow OauthLinkInfo
    { user_id                     = user_id_
    , url                         = url_
    , domain                      = domain_
    , from_app                    = from_app_
    , verified_app_name           = verified_app_name_
    , bot_user_id                 = bot_user_id_
    , request_write_access        = request_write_access_
    , request_phone_number_access = request_phone_number_access_
    , request_ton_wallet_access   = request_ton_wallet_access_
    , dapp_client_id              = dapp_client_id_
    , ton_connect_manifest_url    = ton_connect_manifest_url_
    , ton_proof_payload           = ton_proof_payload_
    , browser                     = browser_
    , platform                    = platform_
    , ip_address                  = ip_address_
    , location                    = location_
    , match_code_first            = match_code_first_
    , match_codes                 = match_codes_
    }
      = "OauthLinkInfo"
        ++ I.cc
        [ "user_id"                     `I.p` user_id_
        , "url"                         `I.p` url_
        , "domain"                      `I.p` domain_
        , "from_app"                    `I.p` from_app_
        , "verified_app_name"           `I.p` verified_app_name_
        , "bot_user_id"                 `I.p` bot_user_id_
        , "request_write_access"        `I.p` request_write_access_
        , "request_phone_number_access" `I.p` request_phone_number_access_
        , "request_ton_wallet_access"   `I.p` request_ton_wallet_access_
        , "dapp_client_id"              `I.p` dapp_client_id_
        , "ton_connect_manifest_url"    `I.p` ton_connect_manifest_url_
        , "ton_proof_payload"           `I.p` ton_proof_payload_
        , "browser"                     `I.p` browser_
        , "platform"                    `I.p` platform_
        , "ip_address"                  `I.p` ip_address_
        , "location"                    `I.p` location_
        , "match_code_first"            `I.p` match_code_first_
        , "match_codes"                 `I.p` match_codes_
        ]

instance AT.FromJSON OauthLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "oauthLinkInfo" -> parseOauthLinkInfo v
      _               -> mempty
    
    where
      parseOauthLinkInfo :: A.Value -> AT.Parser OauthLinkInfo
      parseOauthLinkInfo = A.withObject "OauthLinkInfo" $ \o -> do
        user_id_                     <- o A..:?  "user_id"
        url_                         <- o A..:?  "url"
        domain_                      <- o A..:?  "domain"
        from_app_                    <- o A..:?  "from_app"
        verified_app_name_           <- o A..:?  "verified_app_name"
        bot_user_id_                 <- o A..:?  "bot_user_id"
        request_write_access_        <- o A..:?  "request_write_access"
        request_phone_number_access_ <- o A..:?  "request_phone_number_access"
        request_ton_wallet_access_   <- o A..:?  "request_ton_wallet_access"
        dapp_client_id_              <- o A..:?  "dapp_client_id"
        ton_connect_manifest_url_    <- o A..:?  "ton_connect_manifest_url"
        ton_proof_payload_           <- o A..:?  "ton_proof_payload"
        browser_                     <- o A..:?  "browser"
        platform_                    <- o A..:?  "platform"
        ip_address_                  <- o A..:?  "ip_address"
        location_                    <- o A..:?  "location"
        match_code_first_            <- o A..:?  "match_code_first"
        match_codes_                 <- o A..:?  "match_codes"
        pure $ OauthLinkInfo
          { user_id                     = user_id_
          , url                         = url_
          , domain                      = domain_
          , from_app                    = from_app_
          , verified_app_name           = verified_app_name_
          , bot_user_id                 = bot_user_id_
          , request_write_access        = request_write_access_
          , request_phone_number_access = request_phone_number_access_
          , request_ton_wallet_access   = request_ton_wallet_access_
          , dapp_client_id              = dapp_client_id_
          , ton_connect_manifest_url    = ton_connect_manifest_url_
          , ton_proof_payload           = ton_proof_payload_
          , browser                     = browser_
          , platform                    = platform_
          , ip_address                  = ip_address_
          , location                    = location_
          , match_code_first            = match_code_first_
          , match_codes                 = match_codes_
          }
  parseJSON _ = mempty

