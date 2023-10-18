module TD.Query.DeleteSavedOrderInfo
  (DeleteSavedOrderInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes saved order information. Returns 'TD.Data.Ok.Ok'
data DeleteSavedOrderInfo
  = DeleteSavedOrderInfo
  deriving (Eq, Show)

instance I.ShortShow DeleteSavedOrderInfo where
  shortShow
    DeleteSavedOrderInfo
        = "DeleteSavedOrderInfo"

instance AT.ToJSON DeleteSavedOrderInfo where
  toJSON
    DeleteSavedOrderInfo
        = A.object
          [ "@type" A..= AT.String "deleteSavedOrderInfo"
          ]

