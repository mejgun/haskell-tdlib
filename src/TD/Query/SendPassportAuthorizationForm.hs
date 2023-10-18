module TD.Query.SendPassportAuthorizationForm
  (SendPassportAuthorizationForm(..)
  , defaultSendPassportAuthorizationForm
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType

-- | Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused. Returns 'TD.Data.Ok.Ok'
data SendPassportAuthorizationForm
  = SendPassportAuthorizationForm
    { authorization_form_id :: Maybe Int                                       -- ^ Authorization form identifier
    , types                 :: Maybe [PassportElementType.PassportElementType] -- ^ Types of Telegram Passport elements chosen by user to complete the authorization form
    }
  deriving (Eq, Show)

instance I.ShortShow SendPassportAuthorizationForm where
  shortShow
    SendPassportAuthorizationForm
      { authorization_form_id = authorization_form_id_
      , types                 = types_
      }
        = "SendPassportAuthorizationForm"
          ++ I.cc
          [ "authorization_form_id" `I.p` authorization_form_id_
          , "types"                 `I.p` types_
          ]

instance AT.ToJSON SendPassportAuthorizationForm where
  toJSON
    SendPassportAuthorizationForm
      { authorization_form_id = authorization_form_id_
      , types                 = types_
      }
        = A.object
          [ "@type"                 A..= AT.String "sendPassportAuthorizationForm"
          , "authorization_form_id" A..= authorization_form_id_
          , "types"                 A..= types_
          ]

defaultSendPassportAuthorizationForm :: SendPassportAuthorizationForm
defaultSendPassportAuthorizationForm =
  SendPassportAuthorizationForm
    { authorization_form_id = Nothing
    , types                 = Nothing
    }

