{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import qualified Utils as U

data PasswordState = -- | Represents the current state of 2-step verification @has_password True, if a 2-step verification password is set @password_hint Hint for the password; may be empty
  PasswordState
  { -- | If not 0, point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
    pending_reset_date :: Maybe Int,
    -- | Information about the recovery email address to which the confirmation email was sent; may be null
    recovery_email_address_code_info :: Maybe EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo,
    -- |
    has_passport_data :: Maybe Bool,
    -- | True, if a recovery email is set @has_passport_data True, if some Telegram Passport elements were saved
    has_recovery_email_address :: Maybe Bool,
    -- |
    password_hint :: Maybe String,
    -- |
    has_password :: Maybe Bool
  }
  deriving (Eq)

instance Show PasswordState where
  show
    PasswordState
      { pending_reset_date = pending_reset_date_,
        recovery_email_address_code_info = recovery_email_address_code_info_,
        has_passport_data = has_passport_data_,
        has_recovery_email_address = has_recovery_email_address_,
        password_hint = password_hint_,
        has_password = has_password_
      } =
      "PasswordState"
        ++ U.cc
          [ U.p "pending_reset_date" pending_reset_date_,
            U.p "recovery_email_address_code_info" recovery_email_address_code_info_,
            U.p "has_passport_data" has_passport_data_,
            U.p "has_recovery_email_address" has_recovery_email_address_,
            U.p "password_hint" password_hint_,
            U.p "has_password" has_password_
          ]

instance T.FromJSON PasswordState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passwordState" -> parsePasswordState v
      _ -> mempty
    where
      parsePasswordState :: A.Value -> T.Parser PasswordState
      parsePasswordState = A.withObject "PasswordState" $ \o -> do
        pending_reset_date_ <- mconcat [o A..:? "pending_reset_date", U.rm <$> (o A..: "pending_reset_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        recovery_email_address_code_info_ <- o A..:? "recovery_email_address_code_info"
        has_passport_data_ <- o A..:? "has_passport_data"
        has_recovery_email_address_ <- o A..:? "has_recovery_email_address"
        password_hint_ <- o A..:? "password_hint"
        has_password_ <- o A..:? "has_password"
        return $ PasswordState {pending_reset_date = pending_reset_date_, recovery_email_address_code_info = recovery_email_address_code_info_, has_passport_data = has_passport_data_, has_recovery_email_address = has_recovery_email_address_, password_hint = password_hint_, has_password = has_password_}
  parseJSON _ = mempty

instance T.ToJSON PasswordState where
  toJSON
    PasswordState
      { pending_reset_date = pending_reset_date_,
        recovery_email_address_code_info = recovery_email_address_code_info_,
        has_passport_data = has_passport_data_,
        has_recovery_email_address = has_recovery_email_address_,
        password_hint = password_hint_,
        has_password = has_password_
      } =
      A.object
        [ "@type" A..= T.String "passwordState",
          "pending_reset_date" A..= pending_reset_date_,
          "recovery_email_address_code_info" A..= recovery_email_address_code_info_,
          "has_passport_data" A..= has_passport_data_,
          "has_recovery_email_address" A..= has_recovery_email_address_,
          "password_hint" A..= password_hint_,
          "has_password" A..= has_password_
        ]
