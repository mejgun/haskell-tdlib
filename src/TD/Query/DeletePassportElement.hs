module TD.Query.DeletePassportElement
  (DeletePassportElement(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType

-- | Deletes a Telegram Passport element. Returns 'TD.Data.Ok.Ok'
data DeletePassportElement
  = DeletePassportElement
    { _type :: Maybe PassportElementType.PassportElementType -- ^ Element type
    }
  deriving (Eq, Show)

instance I.ShortShow DeletePassportElement where
  shortShow
    DeletePassportElement
      { _type = _type_
      }
        = "DeletePassportElement"
          ++ I.cc
          [ "_type" `I.p` _type_
          ]

instance AT.ToJSON DeletePassportElement where
  toJSON
    DeletePassportElement
      { _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "deletePassportElement"
          , "type"  A..= _type_
          ]

