module TD.Query.SetAuthenticationEmailAddress
  (SetAuthenticationEmailAddress(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress. Returns 'TD.Data.Ok.Ok'
data SetAuthenticationEmailAddress
  = SetAuthenticationEmailAddress
    { email_address :: Maybe T.Text -- ^ The email address of the user
    }
  deriving (Eq, Show)

instance I.ShortShow SetAuthenticationEmailAddress where
  shortShow
    SetAuthenticationEmailAddress
      { email_address = email_address_
      }
        = "SetAuthenticationEmailAddress"
          ++ I.cc
          [ "email_address" `I.p` email_address_
          ]

instance AT.ToJSON SetAuthenticationEmailAddress where
  toJSON
    SetAuthenticationEmailAddress
      { email_address = email_address_
      }
        = A.object
          [ "@type"         A..= AT.String "setAuthenticationEmailAddress"
          , "email_address" A..= email_address_
          ]

