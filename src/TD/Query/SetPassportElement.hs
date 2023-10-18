module TD.Query.SetPassportElement
  (SetPassportElement(..)
  , defaultSetPassportElement
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputPassportElement as InputPassportElement
import qualified Data.Text as T

-- | Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first. Returns 'TD.Data.PassportElement.PassportElement'
data SetPassportElement
  = SetPassportElement
    { element  :: Maybe InputPassportElement.InputPassportElement -- ^ Input Telegram Passport element
    , password :: Maybe T.Text                                    -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow SetPassportElement where
  shortShow
    SetPassportElement
      { element  = element_
      , password = password_
      }
        = "SetPassportElement"
          ++ I.cc
          [ "element"  `I.p` element_
          , "password" `I.p` password_
          ]

instance AT.ToJSON SetPassportElement where
  toJSON
    SetPassportElement
      { element  = element_
      , password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "setPassportElement"
          , "element"  A..= element_
          , "password" A..= password_
          ]

defaultSetPassportElement :: SetPassportElement
defaultSetPassportElement =
  SetPassportElement
    { element  = Nothing
    , password = Nothing
    }

