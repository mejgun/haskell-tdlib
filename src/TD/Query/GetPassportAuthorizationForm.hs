module TD.Query.GetPassportAuthorizationForm
  (GetPassportAuthorizationForm(..)
  , defaultGetPassportAuthorizationForm
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a Telegram Passport authorization form for sharing data with a service. Returns 'TD.Data.PassportAuthorizationForm.PassportAuthorizationForm'
data GetPassportAuthorizationForm
  = GetPassportAuthorizationForm
    { bot_user_id :: Maybe Int    -- ^ User identifier of the service's bot
    , scope       :: Maybe T.Text -- ^ Telegram Passport element types requested by the service
    , public_key  :: Maybe T.Text -- ^ Service's public key
    , nonce       :: Maybe T.Text -- ^ Unique request identifier provided by the service
    }
  deriving (Eq, Show)

instance I.ShortShow GetPassportAuthorizationForm where
  shortShow
    GetPassportAuthorizationForm
      { bot_user_id = bot_user_id_
      , scope       = scope_
      , public_key  = public_key_
      , nonce       = nonce_
      }
        = "GetPassportAuthorizationForm"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "scope"       `I.p` scope_
          , "public_key"  `I.p` public_key_
          , "nonce"       `I.p` nonce_
          ]

instance AT.ToJSON GetPassportAuthorizationForm where
  toJSON
    GetPassportAuthorizationForm
      { bot_user_id = bot_user_id_
      , scope       = scope_
      , public_key  = public_key_
      , nonce       = nonce_
      }
        = A.object
          [ "@type"       A..= AT.String "getPassportAuthorizationForm"
          , "bot_user_id" A..= bot_user_id_
          , "scope"       A..= scope_
          , "public_key"  A..= public_key_
          , "nonce"       A..= nonce_
          ]

defaultGetPassportAuthorizationForm :: GetPassportAuthorizationForm
defaultGetPassportAuthorizationForm =
  GetPassportAuthorizationForm
    { bot_user_id = Nothing
    , scope       = Nothing
    , public_key  = Nothing
    , nonce       = Nothing
    }

