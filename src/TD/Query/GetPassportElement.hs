module TD.Query.GetPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType

data GetPassportElement -- ^ Returns one of the available Telegram Passport elements
  = GetPassportElement
    { _type    :: Maybe PassportElementType.PassportElementType -- ^ Telegram Passport element type
    , password :: Maybe T.Text                                  -- ^ The 2-step verification password of the current user
    }
  deriving (Eq)

instance Show GetPassportElement where
  show
    GetPassportElement
      { _type    = _type_
      , password = password_
      }
        = "GetPassportElement"
          ++ I.cc
          [ "_type"    `I.p` _type_
          , "password" `I.p` password_
          ]

instance AT.ToJSON GetPassportElement where
  toJSON
    GetPassportElement
      { _type    = _type_
      , password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getPassportElement"
          , "type"     A..= _type_
          , "password" A..= password_
          ]
