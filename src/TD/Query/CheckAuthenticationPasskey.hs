module TD.Query.CheckAuthenticationPasskey
  (CheckAuthenticationPasskey(..)
  , defaultCheckAuthenticationPasskey
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

-- | Checks a passkey to log in to the corresponding account. Call getAuthenticationPasskeyParameters to get parameters for the passkey. Works only when the current authorization state is authorizationStateWaitPhoneNumber or authorizationStateWaitOtherDeviceConfirmation, or if there is no pending authentication query and the current authorization state is authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword. Returns 'TD.Data.Ok.Ok'
data CheckAuthenticationPasskey
  = CheckAuthenticationPasskey
    { credential_id      :: Maybe T.Text        -- ^ Base64url-encoded identifier of the credential
    , client_data        :: Maybe T.Text        -- ^ JSON-encoded client data
    , authenticator_data :: Maybe BS.ByteString -- ^ Authenticator data of the application that created the credential
    , signature          :: Maybe BS.ByteString -- ^ Cryptographic signature of the credential
    , user_handle        :: Maybe BS.ByteString -- ^ User handle of the passkey
    }
  deriving (Eq, Show)

instance I.ShortShow CheckAuthenticationPasskey where
  shortShow
    CheckAuthenticationPasskey
      { credential_id      = credential_id_
      , client_data        = client_data_
      , authenticator_data = authenticator_data_
      , signature          = signature_
      , user_handle        = user_handle_
      }
        = "CheckAuthenticationPasskey"
          ++ I.cc
          [ "credential_id"      `I.p` credential_id_
          , "client_data"        `I.p` client_data_
          , "authenticator_data" `I.p` authenticator_data_
          , "signature"          `I.p` signature_
          , "user_handle"        `I.p` user_handle_
          ]

instance AT.ToJSON CheckAuthenticationPasskey where
  toJSON
    CheckAuthenticationPasskey
      { credential_id      = credential_id_
      , client_data        = client_data_
      , authenticator_data = authenticator_data_
      , signature          = signature_
      , user_handle        = user_handle_
      }
        = A.object
          [ "@type"              A..= AT.String "checkAuthenticationPasskey"
          , "credential_id"      A..= credential_id_
          , "client_data"        A..= client_data_
          , "authenticator_data" A..= fmap I.writeBytes  authenticator_data_
          , "signature"          A..= fmap I.writeBytes  signature_
          , "user_handle"        A..= fmap I.writeBytes  user_handle_
          ]

defaultCheckAuthenticationPasskey :: CheckAuthenticationPasskey
defaultCheckAuthenticationPasskey =
  CheckAuthenticationPasskey
    { credential_id      = Nothing
    , client_data        = Nothing
    , authenticator_data = Nothing
    , signature          = Nothing
    , user_handle        = Nothing
    }

