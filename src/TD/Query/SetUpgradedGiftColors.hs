module TD.Query.SetUpgradedGiftColors
  (SetUpgradedGiftColors(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes color scheme for the current user based on an owned or a hosted upgraded gift; for Telegram Premium users only. Returns 'TD.Data.Ok.Ok'
data SetUpgradedGiftColors
  = SetUpgradedGiftColors
    { upgraded_gift_colors_id :: Maybe Int -- ^ Identifier of the upgradedGiftColors scheme to use
    }
  deriving (Eq, Show)

instance I.ShortShow SetUpgradedGiftColors where
  shortShow
    SetUpgradedGiftColors
      { upgraded_gift_colors_id = upgraded_gift_colors_id_
      }
        = "SetUpgradedGiftColors"
          ++ I.cc
          [ "upgraded_gift_colors_id" `I.p` upgraded_gift_colors_id_
          ]

instance AT.ToJSON SetUpgradedGiftColors where
  toJSON
    SetUpgradedGiftColors
      { upgraded_gift_colors_id = upgraded_gift_colors_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "setUpgradedGiftColors"
          , "upgraded_gift_colors_id" A..= fmap I.writeInt64  upgraded_gift_colors_id_
          ]

