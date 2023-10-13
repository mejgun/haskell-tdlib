module TD.Query.GetPassportAuthorizationFormAvailableElements(GetPassportAuthorizationFormAvailableElements(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetPassportAuthorizationFormAvailableElements -- ^ Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form
  = GetPassportAuthorizationFormAvailableElements
    { authorization_form_id :: Maybe Int    -- ^ Authorization form identifier
    , password              :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq)

instance Show GetPassportAuthorizationFormAvailableElements where
  show
    GetPassportAuthorizationFormAvailableElements
      { authorization_form_id = authorization_form_id_
      , password              = password_
      }
        = "GetPassportAuthorizationFormAvailableElements"
          ++ I.cc
          [ "authorization_form_id" `I.p` authorization_form_id_
          , "password"              `I.p` password_
          ]

instance AT.ToJSON GetPassportAuthorizationFormAvailableElements where
  toJSON
    GetPassportAuthorizationFormAvailableElements
      { authorization_form_id = authorization_form_id_
      , password              = password_
      }
        = A.object
          [ "@type"                 A..= AT.String "getPassportAuthorizationFormAvailableElements"
          , "authorization_form_id" A..= authorization_form_id_
          , "password"              A..= password_
          ]
