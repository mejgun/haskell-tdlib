module TD.Query.SendPhoneNumberVerificationCode
  (SendPhoneNumberVerificationCode(..)
  , defaultSendPhoneNumberVerificationCode
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

data SendPhoneNumberVerificationCode -- ^ Sends a code to verify a phone number to be added to a user's Telegram Passport
  = SendPhoneNumberVerificationCode
    { phone_number :: Maybe T.Text                                                              -- ^ The phone number of the user, in international format
    , settings     :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings -- ^ Settings for the authentication of the user's phone number; pass null to use default settings
    }
  deriving (Eq)

instance Show SendPhoneNumberVerificationCode where
  show
    SendPhoneNumberVerificationCode
      { phone_number = phone_number_
      , settings     = settings_
      }
        = "SendPhoneNumberVerificationCode"
          ++ I.cc
          [ "phone_number" `I.p` phone_number_
          , "settings"     `I.p` settings_
          ]

instance AT.ToJSON SendPhoneNumberVerificationCode where
  toJSON
    SendPhoneNumberVerificationCode
      { phone_number = phone_number_
      , settings     = settings_
      }
        = A.object
          [ "@type"        A..= AT.String "sendPhoneNumberVerificationCode"
          , "phone_number" A..= phone_number_
          , "settings"     A..= settings_
          ]

defaultSendPhoneNumberVerificationCode :: SendPhoneNumberVerificationCode
defaultSendPhoneNumberVerificationCode =
  SendPhoneNumberVerificationCode
    { phone_number = Nothing
    , settings     = Nothing
    }

