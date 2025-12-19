module TD.Query.AddLoginPasskey
  (AddLoginPasskey(..)
  , defaultAddLoginPasskey
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

-- | Adds a passkey allowed to be used for the login by the current user and returns the added passkey. Call getPasskeyParameters to get parameters for creating of the passkey. Returns 'TD.Data.Passkey.Passkey'
data AddLoginPasskey
  = AddLoginPasskey
    { client_data        :: Maybe T.Text        -- ^ JSON-encoded client data
    , attestation_object :: Maybe BS.ByteString -- ^ Passkey attestation object
    }
  deriving (Eq, Show)

instance I.ShortShow AddLoginPasskey where
  shortShow
    AddLoginPasskey
      { client_data        = client_data_
      , attestation_object = attestation_object_
      }
        = "AddLoginPasskey"
          ++ I.cc
          [ "client_data"        `I.p` client_data_
          , "attestation_object" `I.p` attestation_object_
          ]

instance AT.ToJSON AddLoginPasskey where
  toJSON
    AddLoginPasskey
      { client_data        = client_data_
      , attestation_object = attestation_object_
      }
        = A.object
          [ "@type"              A..= AT.String "addLoginPasskey"
          , "client_data"        A..= client_data_
          , "attestation_object" A..= fmap I.writeBytes  attestation_object_
          ]

defaultAddLoginPasskey :: AddLoginPasskey
defaultAddLoginPasskey =
  AddLoginPasskey
    { client_data        = Nothing
    , attestation_object = Nothing
    }

