module TD.Query.SetAuthenticationPhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

data SetAuthenticationPhoneNumber -- ^ Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber, or if there is no pending authentication query and the current authorization state is authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
  = SetAuthenticationPhoneNumber
    { phone_number :: Maybe T.Text                                                              -- ^ The phone number of the user, in international format
    , settings     :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings -- ^ Settings for the authentication of the user's phone number; pass null to use default settings
    }
  deriving (Eq)

instance Show SetAuthenticationPhoneNumber where
  show
    SetAuthenticationPhoneNumber
      { phone_number = phone_number_
      , settings     = settings_
      }
        = "SetAuthenticationPhoneNumber"
          ++ I.cc
          [ "phone_number" `I.p` phone_number_
          , "settings"     `I.p` settings_
          ]

instance AT.ToJSON SetAuthenticationPhoneNumber where
  toJSON
    SetAuthenticationPhoneNumber
      { phone_number = phone_number_
      , settings     = settings_
      }
        = A.object
          [ "@type"        A..= AT.String "setAuthenticationPhoneNumber"
          , "phone_number" A..= phone_number_
          , "settings"     A..= settings_
          ]
