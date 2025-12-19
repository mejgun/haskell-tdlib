module TD.Query.GetUpgradedGiftsPromotionalAnimation
  (GetUpgradedGiftsPromotionalAnimation(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns promotional anumation for upgraded gifts. Returns 'TD.Data.Animation.Animation'
data GetUpgradedGiftsPromotionalAnimation
  = GetUpgradedGiftsPromotionalAnimation
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGiftsPromotionalAnimation where
  shortShow
    GetUpgradedGiftsPromotionalAnimation
        = "GetUpgradedGiftsPromotionalAnimation"

instance AT.ToJSON GetUpgradedGiftsPromotionalAnimation where
  toJSON
    GetUpgradedGiftsPromotionalAnimation
        = A.object
          [ "@type" A..= AT.String "getUpgradedGiftsPromotionalAnimation"
          ]

