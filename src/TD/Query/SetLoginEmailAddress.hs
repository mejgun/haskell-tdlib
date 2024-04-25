module TD.Query.SetLoginEmailAddress
  (SetLoginEmailAddress(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the login email address of the user. The email address can be changed only if the current user already has login email and passwordState.login_email_address_pattern is non-empty. The change will not be applied until the new login email address is confirmed with checkLoginEmailAddressCode. To use Apple ID/Google ID instead of an email address, call checkLoginEmailAddressCode directly. Returns 'TD.Data.EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo'
data SetLoginEmailAddress
  = SetLoginEmailAddress
    { new_login_email_address :: Maybe T.Text -- ^ New login email address
    }
  deriving (Eq, Show)

instance I.ShortShow SetLoginEmailAddress where
  shortShow
    SetLoginEmailAddress
      { new_login_email_address = new_login_email_address_
      }
        = "SetLoginEmailAddress"
          ++ I.cc
          [ "new_login_email_address" `I.p` new_login_email_address_
          ]

instance AT.ToJSON SetLoginEmailAddress where
  toJSON
    SetLoginEmailAddress
      { new_login_email_address = new_login_email_address_
      }
        = A.object
          [ "@type"                   A..= AT.String "setLoginEmailAddress"
          , "new_login_email_address" A..= new_login_email_address_
          ]

