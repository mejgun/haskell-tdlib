module TD.Query.GetUpgradedGiftVariants
  (GetUpgradedGiftVariants(..)
  , defaultGetUpgradedGiftVariants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all possible variants of upgraded gifts for a regular gift. Returns 'TD.Data.GiftUpgradeVariants.GiftUpgradeVariants'
data GetUpgradedGiftVariants
  = GetUpgradedGiftVariants
    { regular_gift_id       :: Maybe Int  -- ^ Identifier of the regular gift
    , return_upgrade_models :: Maybe Bool -- ^ Pass true to get models that can be obtained by upgrading a regular gift
    , return_craft_models   :: Maybe Bool -- ^ Pass true to get models that can be obtained by crafting a gift from upgraded gifts
    }
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGiftVariants where
  shortShow
    GetUpgradedGiftVariants
      { regular_gift_id       = regular_gift_id_
      , return_upgrade_models = return_upgrade_models_
      , return_craft_models   = return_craft_models_
      }
        = "GetUpgradedGiftVariants"
          ++ I.cc
          [ "regular_gift_id"       `I.p` regular_gift_id_
          , "return_upgrade_models" `I.p` return_upgrade_models_
          , "return_craft_models"   `I.p` return_craft_models_
          ]

instance AT.ToJSON GetUpgradedGiftVariants where
  toJSON
    GetUpgradedGiftVariants
      { regular_gift_id       = regular_gift_id_
      , return_upgrade_models = return_upgrade_models_
      , return_craft_models   = return_craft_models_
      }
        = A.object
          [ "@type"                 A..= AT.String "getUpgradedGiftVariants"
          , "regular_gift_id"       A..= fmap I.writeInt64  regular_gift_id_
          , "return_upgrade_models" A..= return_upgrade_models_
          , "return_craft_models"   A..= return_craft_models_
          ]

defaultGetUpgradedGiftVariants :: GetUpgradedGiftVariants
defaultGetUpgradedGiftVariants =
  GetUpgradedGiftVariants
    { regular_gift_id       = Nothing
    , return_upgrade_models = Nothing
    , return_craft_models   = Nothing
    }

