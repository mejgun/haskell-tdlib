module TD.Data.PasswordState
  (PasswordState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo

data PasswordState
  = PasswordState -- ^ Represents the current state of 2-step verification
    { has_password                     :: Maybe Bool                                                                  -- ^ True, if a 2-step verification password is set
    , password_hint                    :: Maybe T.Text                                                                -- ^ Hint for the password; may be empty
    , has_recovery_email_address       :: Maybe Bool                                                                  -- ^ True, if a recovery email is set
    , has_passport_data                :: Maybe Bool                                                                  -- ^ True, if some Telegram Passport elements were saved
    , recovery_email_address_code_info :: Maybe EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo -- ^ Information about the recovery email address to which the confirmation email was sent; may be null
    , login_email_address_pattern      :: Maybe T.Text                                                                -- ^ Pattern of the email address set up for logging in
    , pending_reset_date               :: Maybe Int                                                                   -- ^ If not 0, point in time (Unix timestamp) after which the 2-step verification password can be reset immediately using resetPassword
    }
  deriving (Eq, Show)

instance I.ShortShow PasswordState where
  shortShow PasswordState
    { has_password                     = has_password_
    , password_hint                    = password_hint_
    , has_recovery_email_address       = has_recovery_email_address_
    , has_passport_data                = has_passport_data_
    , recovery_email_address_code_info = recovery_email_address_code_info_
    , login_email_address_pattern      = login_email_address_pattern_
    , pending_reset_date               = pending_reset_date_
    }
      = "PasswordState"
        ++ I.cc
        [ "has_password"                     `I.p` has_password_
        , "password_hint"                    `I.p` password_hint_
        , "has_recovery_email_address"       `I.p` has_recovery_email_address_
        , "has_passport_data"                `I.p` has_passport_data_
        , "recovery_email_address_code_info" `I.p` recovery_email_address_code_info_
        , "login_email_address_pattern"      `I.p` login_email_address_pattern_
        , "pending_reset_date"               `I.p` pending_reset_date_
        ]

instance AT.FromJSON PasswordState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passwordState" -> parsePasswordState v
      _               -> mempty
    
    where
      parsePasswordState :: A.Value -> AT.Parser PasswordState
      parsePasswordState = A.withObject "PasswordState" $ \o -> do
        has_password_                     <- o A..:?  "has_password"
        password_hint_                    <- o A..:?  "password_hint"
        has_recovery_email_address_       <- o A..:?  "has_recovery_email_address"
        has_passport_data_                <- o A..:?  "has_passport_data"
        recovery_email_address_code_info_ <- o A..:?  "recovery_email_address_code_info"
        login_email_address_pattern_      <- o A..:?  "login_email_address_pattern"
        pending_reset_date_               <- o A..:?  "pending_reset_date"
        pure $ PasswordState
          { has_password                     = has_password_
          , password_hint                    = password_hint_
          , has_recovery_email_address       = has_recovery_email_address_
          , has_passport_data                = has_passport_data_
          , recovery_email_address_code_info = recovery_email_address_code_info_
          , login_email_address_pattern      = login_email_address_pattern_
          , pending_reset_date               = pending_reset_date_
          }
  parseJSON _ = mempty

