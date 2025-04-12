module TD.Query.UpgradeGift
  (UpgradeGift(..)
  , defaultUpgradeGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Upgrades a regular gift. Returns 'TD.Data.UpgradeGiftResult.UpgradeGiftResult'
data UpgradeGift
  = UpgradeGift
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection on behalf of which to send the request; for bots only
    , received_gift_id       :: Maybe T.Text -- ^ Identifier of the gift
    , keep_original_details  :: Maybe Bool   -- ^ Pass true to keep the original gift text, sender and receiver in the upgraded gift
    , star_count             :: Maybe Int    -- ^ The amount of Telegram Stars required to pay for the upgrade. It the gift has prepaid_upgrade_star_count > 0, then pass 0, otherwise, pass gift.upgrade_star_count
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradeGift where
  shortShow
    UpgradeGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      , keep_original_details  = keep_original_details_
      , star_count             = star_count_
      }
        = "UpgradeGift"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "received_gift_id"       `I.p` received_gift_id_
          , "keep_original_details"  `I.p` keep_original_details_
          , "star_count"             `I.p` star_count_
          ]

instance AT.ToJSON UpgradeGift where
  toJSON
    UpgradeGift
      { business_connection_id = business_connection_id_
      , received_gift_id       = received_gift_id_
      , keep_original_details  = keep_original_details_
      , star_count             = star_count_
      }
        = A.object
          [ "@type"                  A..= AT.String "upgradeGift"
          , "business_connection_id" A..= business_connection_id_
          , "received_gift_id"       A..= received_gift_id_
          , "keep_original_details"  A..= keep_original_details_
          , "star_count"             A..= star_count_
          ]

defaultUpgradeGift :: UpgradeGift
defaultUpgradeGift =
  UpgradeGift
    { business_connection_id = Nothing
    , received_gift_id       = Nothing
    , keep_original_details  = Nothing
    , star_count             = Nothing
    }

