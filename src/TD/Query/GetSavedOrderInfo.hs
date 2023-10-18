module TD.Query.GetSavedOrderInfo
  (GetSavedOrderInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns saved order information. Returns a 404 error if there is no saved order information. Returns 'TD.Data.OrderInfo.OrderInfo'
data GetSavedOrderInfo
  = GetSavedOrderInfo
  deriving (Eq, Show)

instance I.ShortShow GetSavedOrderInfo where
  shortShow
    GetSavedOrderInfo
        = "GetSavedOrderInfo"

instance AT.ToJSON GetSavedOrderInfo where
  toJSON
    GetSavedOrderInfo
        = A.object
          [ "@type" A..= AT.String "getSavedOrderInfo"
          ]

