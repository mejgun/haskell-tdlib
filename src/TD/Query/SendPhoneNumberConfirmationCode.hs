module TD.Query.SendPhoneNumberConfirmationCode
  (SendPhoneNumberConfirmationCode(..)
  , defaultSendPhoneNumberConfirmationCode
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

-- | Sends phone number confirmation code to handle links of the type internalLinkTypePhoneNumberConfirmation
data SendPhoneNumberConfirmationCode
  = SendPhoneNumberConfirmationCode
    { hash         :: Maybe T.Text                                                              -- ^ Hash value from the link
    , phone_number :: Maybe T.Text                                                              -- ^ Phone number value from the link
    , settings     :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings -- ^ Settings for the authentication of the user's phone number; pass null to use default settings
    }
  deriving (Eq, Show)

instance I.ShortShow SendPhoneNumberConfirmationCode where
  shortShow
    SendPhoneNumberConfirmationCode
      { hash         = hash_
      , phone_number = phone_number_
      , settings     = settings_
      }
        = "SendPhoneNumberConfirmationCode"
          ++ I.cc
          [ "hash"         `I.p` hash_
          , "phone_number" `I.p` phone_number_
          , "settings"     `I.p` settings_
          ]

instance AT.ToJSON SendPhoneNumberConfirmationCode where
  toJSON
    SendPhoneNumberConfirmationCode
      { hash         = hash_
      , phone_number = phone_number_
      , settings     = settings_
      }
        = A.object
          [ "@type"        A..= AT.String "sendPhoneNumberConfirmationCode"
          , "hash"         A..= hash_
          , "phone_number" A..= phone_number_
          , "settings"     A..= settings_
          ]

defaultSendPhoneNumberConfirmationCode :: SendPhoneNumberConfirmationCode
defaultSendPhoneNumberConfirmationCode =
  SendPhoneNumberConfirmationCode
    { hash         = Nothing
    , phone_number = Nothing
    , settings     = Nothing
    }

