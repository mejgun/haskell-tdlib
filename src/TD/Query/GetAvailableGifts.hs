module TD.Query.GetAvailableGifts
  (GetAvailableGifts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns gifts that can be sent to other users. Returns 'TD.Data.Gifts.Gifts'
data GetAvailableGifts
  = GetAvailableGifts
  deriving (Eq, Show)

instance I.ShortShow GetAvailableGifts where
  shortShow
    GetAvailableGifts
        = "GetAvailableGifts"

instance AT.ToJSON GetAvailableGifts where
  toJSON
    GetAvailableGifts
        = A.object
          [ "@type" A..= AT.String "getAvailableGifts"
          ]

