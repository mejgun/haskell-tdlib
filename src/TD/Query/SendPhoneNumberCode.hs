module TD.Query.SendPhoneNumberCode
  (SendPhoneNumberCode(..)
  , defaultSendPhoneNumberCode
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified TD.Data.PhoneNumberCodeType as PhoneNumberCodeType

-- | Sends a code to the specified phone number. Aborts previous phone number verification if there was one. On success, returns information about the sent code. Returns 'TD.Data.AuthenticationCodeInfo.AuthenticationCodeInfo'
data SendPhoneNumberCode
  = SendPhoneNumberCode
    { phone_number :: Maybe T.Text                                                              -- ^ The phone number, in international format
    , settings     :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings -- ^ Settings for the authentication of the user's phone number; pass null to use default settings
    , _type        :: Maybe PhoneNumberCodeType.PhoneNumberCodeType                             -- ^ Type of the request for which the code is sent
    }
  deriving (Eq, Show)

instance I.ShortShow SendPhoneNumberCode where
  shortShow
    SendPhoneNumberCode
      { phone_number = phone_number_
      , settings     = settings_
      , _type        = _type_
      }
        = "SendPhoneNumberCode"
          ++ I.cc
          [ "phone_number" `I.p` phone_number_
          , "settings"     `I.p` settings_
          , "_type"        `I.p` _type_
          ]

instance AT.ToJSON SendPhoneNumberCode where
  toJSON
    SendPhoneNumberCode
      { phone_number = phone_number_
      , settings     = settings_
      , _type        = _type_
      }
        = A.object
          [ "@type"        A..= AT.String "sendPhoneNumberCode"
          , "phone_number" A..= phone_number_
          , "settings"     A..= settings_
          , "type"         A..= _type_
          ]

defaultSendPhoneNumberCode :: SendPhoneNumberCode
defaultSendPhoneNumberCode =
  SendPhoneNumberCode
    { phone_number = Nothing
    , settings     = Nothing
    , _type        = Nothing
    }

