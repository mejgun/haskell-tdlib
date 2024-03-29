module TD.Query.ChangePhoneNumber
  (ChangePhoneNumber(..)
  , defaultChangePhoneNumber
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

-- | Changes the phone number of the user and sends an authentication code to the user's new phone number; for official Android and iOS applications only. On success, returns information about the sent code. Returns 'TD.Data.AuthenticationCodeInfo.AuthenticationCodeInfo'
data ChangePhoneNumber
  = ChangePhoneNumber
    { phone_number :: Maybe T.Text                                                              -- ^ The new phone number of the user in international format
    , settings     :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings -- ^ Settings for the authentication of the user's phone number; pass null to use default settings
    }
  deriving (Eq, Show)

instance I.ShortShow ChangePhoneNumber where
  shortShow
    ChangePhoneNumber
      { phone_number = phone_number_
      , settings     = settings_
      }
        = "ChangePhoneNumber"
          ++ I.cc
          [ "phone_number" `I.p` phone_number_
          , "settings"     `I.p` settings_
          ]

instance AT.ToJSON ChangePhoneNumber where
  toJSON
    ChangePhoneNumber
      { phone_number = phone_number_
      , settings     = settings_
      }
        = A.object
          [ "@type"        A..= AT.String "changePhoneNumber"
          , "phone_number" A..= phone_number_
          , "settings"     A..= settings_
          ]

defaultChangePhoneNumber :: ChangePhoneNumber
defaultChangePhoneNumber =
  ChangePhoneNumber
    { phone_number = Nothing
    , settings     = Nothing
    }

