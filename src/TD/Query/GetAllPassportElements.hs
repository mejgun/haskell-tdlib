module TD.Query.GetAllPassportElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetAllPassportElements -- ^ Returns all available Telegram Passport elements
  = GetAllPassportElements
    { password :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq)

instance Show GetAllPassportElements where
  show
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
