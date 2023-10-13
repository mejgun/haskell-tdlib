module TD.Query.DeleteSavedOrderInfo(DeleteSavedOrderInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data DeleteSavedOrderInfo -- ^ Deletes saved order information
  = DeleteSavedOrderInfo
  deriving (Eq)

instance Show DeleteSavedOrderInfo where
  show
    DeleteSavedOrderInfo
        = "DeleteSavedOrderInfo"

instance AT.ToJSON DeleteSavedOrderInfo where
  toJSON
    DeleteSavedOrderInfo
        = A.object
          [ "@type" A..= AT.String "deleteSavedOrderInfo"
          ]
