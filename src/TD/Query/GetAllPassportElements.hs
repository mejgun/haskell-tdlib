module TD.Query.GetAllPassportElements
  (GetAllPassportElements(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns all available Telegram Passport elements. Returns 'TD.Data.PassportElements.PassportElements'
data GetAllPassportElements
  = GetAllPassportElements
    { password :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetAllPassportElements where
  shortShow
    GetAllPassportElements
      { password = password_
      }
        = "GetAllPassportElements"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON GetAllPassportElements where
  toJSON
    GetAllPassportElements
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getAllPassportElements"
          , "password" A..= password_
          ]

