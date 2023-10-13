module TD.Query.GetSavedOrderInfo
  (GetSavedOrderInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetSavedOrderInfo -- ^ Returns saved order information. Returns a 404 error if there is no saved order information
  = GetSavedOrderInfo
  deriving (Eq)

instance Show GetSavedOrderInfo where
  show
    GetSavedOrderInfo
        = "GetSavedOrderInfo"

instance AT.ToJSON GetSavedOrderInfo where
  toJSON
    GetSavedOrderInfo
        = A.object
          [ "@type" A..= AT.String "getSavedOrderInfo"
          ]

