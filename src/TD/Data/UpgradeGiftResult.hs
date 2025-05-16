module TD.Data.UpgradeGiftResult
  (UpgradeGiftResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGift as UpgradedGift
import qualified Data.Text as T

data UpgradeGiftResult
  = UpgradeGiftResult -- ^ Contains result of gift upgrading
    { gift                :: Maybe UpgradedGift.UpgradedGift -- ^ The upgraded gift
    , received_gift_id    :: Maybe T.Text                    -- ^ Unique identifier of the received gift for the current user
    , is_saved            :: Maybe Bool                      -- ^ True, if the gift is displayed on the user's or the channel's profile page
    , can_be_transferred  :: Maybe Bool                      -- ^ True, if the gift can be transferred to another owner
    , transfer_star_count :: Maybe Int                       -- ^ Number of Telegram Stars that must be paid to transfer the upgraded gift
    , next_transfer_date  :: Maybe Int                       -- ^ Point in time (Unix timestamp) when the gift can be transferred to another owner; 0 if the gift can be transferred immediately or transfer isn't possible
    , next_resale_date    :: Maybe Int                       -- ^ Point in time (Unix timestamp) when the gift can be resold to another user; 0 if the gift can't be resold; only for the receiver of the gift
    , export_date         :: Maybe Int                       -- ^ Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradeGiftResult where
  shortShow UpgradeGiftResult
    { gift                = gift_
    , received_gift_id    = received_gift_id_
    , is_saved            = is_saved_
    , can_be_transferred  = can_be_transferred_
    , transfer_star_count = transfer_star_count_
    , next_transfer_date  = next_transfer_date_
    , next_resale_date    = next_resale_date_
    , export_date         = export_date_
    }
      = "UpgradeGiftResult"
        ++ I.cc
        [ "gift"                `I.p` gift_
        , "received_gift_id"    `I.p` received_gift_id_
        , "is_saved"            `I.p` is_saved_
        , "can_be_transferred"  `I.p` can_be_transferred_
        , "transfer_star_count" `I.p` transfer_star_count_
        , "next_transfer_date"  `I.p` next_transfer_date_
        , "next_resale_date"    `I.p` next_resale_date_
        , "export_date"         `I.p` export_date_
        ]

instance AT.FromJSON UpgradeGiftResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradeGiftResult" -> parseUpgradeGiftResult v
      _                   -> mempty
    
    where
      parseUpgradeGiftResult :: A.Value -> AT.Parser UpgradeGiftResult
      parseUpgradeGiftResult = A.withObject "UpgradeGiftResult" $ \o -> do
        gift_                <- o A..:?  "gift"
        received_gift_id_    <- o A..:?  "received_gift_id"
        is_saved_            <- o A..:?  "is_saved"
        can_be_transferred_  <- o A..:?  "can_be_transferred"
        transfer_star_count_ <- o A..:?  "transfer_star_count"
        next_transfer_date_  <- o A..:?  "next_transfer_date"
        next_resale_date_    <- o A..:?  "next_resale_date"
        export_date_         <- o A..:?  "export_date"
        pure $ UpgradeGiftResult
          { gift                = gift_
          , received_gift_id    = received_gift_id_
          , is_saved            = is_saved_
          , can_be_transferred  = can_be_transferred_
          , transfer_star_count = transfer_star_count_
          , next_transfer_date  = next_transfer_date_
          , next_resale_date    = next_resale_date_
          , export_date         = export_date_
          }
  parseJSON _ = mempty

