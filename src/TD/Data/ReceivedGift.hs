module TD.Data.ReceivedGift
  (ReceivedGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.SentGift as SentGift

data ReceivedGift
  = ReceivedGift -- ^ Represents a gift received by a user or a chat
    { received_gift_id           :: Maybe T.Text                      -- ^ Unique identifier of the received gift for the current user; only for the receiver of the gift
    , sender_id                  :: Maybe MessageSender.MessageSender -- ^ Identifier of a user or a chat that sent the gift; may be null if unknown
    , text                       :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , is_private                 :: Maybe Bool                        -- ^ True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone are able to see them
    , is_saved                   :: Maybe Bool                        -- ^ True, if the gift is displayed on the chat's profile page; only for the receiver of the gift
    , is_pinned                  :: Maybe Bool                        -- ^ True, if the gift is pinned to the top of the chat's profile page
    , can_be_upgraded            :: Maybe Bool                        -- ^ True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift
    , can_be_transferred         :: Maybe Bool                        -- ^ True, if the gift is an upgraded gift that can be transferred to another owner; only for the receiver of the gift
    , was_refunded               :: Maybe Bool                        -- ^ True, if the gift was refunded and isn't available anymore
    , date                       :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift was sent
    , gift                       :: Maybe SentGift.SentGift           -- ^ The gift
    , collection_ids             :: Maybe [Int]                       -- ^ Identifiers of collections to which the gift is added; only for the receiver of the gift
    , sell_star_count            :: Maybe Int                         -- ^ Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user
    , prepaid_upgrade_star_count :: Maybe Int                         -- ^ Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
    , is_upgrade_separate        :: Maybe Bool                        -- ^ True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost
    , transfer_star_count        :: Maybe Int                         -- ^ Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
    , next_transfer_date         :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift
    , next_resale_date           :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
    , export_date                :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the upgraded gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift
    , prepaid_upgrade_hash       :: Maybe T.Text                      -- ^ If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade
    }
  deriving (Eq, Show)

instance I.ShortShow ReceivedGift where
  shortShow ReceivedGift
    { received_gift_id           = received_gift_id_
    , sender_id                  = sender_id_
    , text                       = text_
    , is_private                 = is_private_
    , is_saved                   = is_saved_
    , is_pinned                  = is_pinned_
    , can_be_upgraded            = can_be_upgraded_
    , can_be_transferred         = can_be_transferred_
    , was_refunded               = was_refunded_
    , date                       = date_
    , gift                       = gift_
    , collection_ids             = collection_ids_
    , sell_star_count            = sell_star_count_
    , prepaid_upgrade_star_count = prepaid_upgrade_star_count_
    , is_upgrade_separate        = is_upgrade_separate_
    , transfer_star_count        = transfer_star_count_
    , next_transfer_date         = next_transfer_date_
    , next_resale_date           = next_resale_date_
    , export_date                = export_date_
    , prepaid_upgrade_hash       = prepaid_upgrade_hash_
    }
      = "ReceivedGift"
        ++ I.cc
        [ "received_gift_id"           `I.p` received_gift_id_
        , "sender_id"                  `I.p` sender_id_
        , "text"                       `I.p` text_
        , "is_private"                 `I.p` is_private_
        , "is_saved"                   `I.p` is_saved_
        , "is_pinned"                  `I.p` is_pinned_
        , "can_be_upgraded"            `I.p` can_be_upgraded_
        , "can_be_transferred"         `I.p` can_be_transferred_
        , "was_refunded"               `I.p` was_refunded_
        , "date"                       `I.p` date_
        , "gift"                       `I.p` gift_
        , "collection_ids"             `I.p` collection_ids_
        , "sell_star_count"            `I.p` sell_star_count_
        , "prepaid_upgrade_star_count" `I.p` prepaid_upgrade_star_count_
        , "is_upgrade_separate"        `I.p` is_upgrade_separate_
        , "transfer_star_count"        `I.p` transfer_star_count_
        , "next_transfer_date"         `I.p` next_transfer_date_
        , "next_resale_date"           `I.p` next_resale_date_
        , "export_date"                `I.p` export_date_
        , "prepaid_upgrade_hash"       `I.p` prepaid_upgrade_hash_
        ]

instance AT.FromJSON ReceivedGift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "receivedGift" -> parseReceivedGift v
      _              -> mempty
    
    where
      parseReceivedGift :: A.Value -> AT.Parser ReceivedGift
      parseReceivedGift = A.withObject "ReceivedGift" $ \o -> do
        received_gift_id_           <- o A..:?  "received_gift_id"
        sender_id_                  <- o A..:?  "sender_id"
        text_                       <- o A..:?  "text"
        is_private_                 <- o A..:?  "is_private"
        is_saved_                   <- o A..:?  "is_saved"
        is_pinned_                  <- o A..:?  "is_pinned"
        can_be_upgraded_            <- o A..:?  "can_be_upgraded"
        can_be_transferred_         <- o A..:?  "can_be_transferred"
        was_refunded_               <- o A..:?  "was_refunded"
        date_                       <- o A..:?  "date"
        gift_                       <- o A..:?  "gift"
        collection_ids_             <- o A..:?  "collection_ids"
        sell_star_count_            <- o A..:?  "sell_star_count"
        prepaid_upgrade_star_count_ <- o A..:?  "prepaid_upgrade_star_count"
        is_upgrade_separate_        <- o A..:?  "is_upgrade_separate"
        transfer_star_count_        <- o A..:?  "transfer_star_count"
        next_transfer_date_         <- o A..:?  "next_transfer_date"
        next_resale_date_           <- o A..:?  "next_resale_date"
        export_date_                <- o A..:?  "export_date"
        prepaid_upgrade_hash_       <- o A..:?  "prepaid_upgrade_hash"
        pure $ ReceivedGift
          { received_gift_id           = received_gift_id_
          , sender_id                  = sender_id_
          , text                       = text_
          , is_private                 = is_private_
          , is_saved                   = is_saved_
          , is_pinned                  = is_pinned_
          , can_be_upgraded            = can_be_upgraded_
          , can_be_transferred         = can_be_transferred_
          , was_refunded               = was_refunded_
          , date                       = date_
          , gift                       = gift_
          , collection_ids             = collection_ids_
          , sell_star_count            = sell_star_count_
          , prepaid_upgrade_star_count = prepaid_upgrade_star_count_
          , is_upgrade_separate        = is_upgrade_separate_
          , transfer_star_count        = transfer_star_count_
          , next_transfer_date         = next_transfer_date_
          , next_resale_date           = next_resale_date_
          , export_date                = export_date_
          , prepaid_upgrade_hash       = prepaid_upgrade_hash_
          }
  parseJSON _ = mempty

