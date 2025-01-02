module TD.Data.UserGift
  (UserGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.SentGift as SentGift

data UserGift
  = UserGift -- ^ Represents a gift received by a user
    { sender_user_id             :: Maybe Int                         -- ^ Identifier of the user that sent the gift; 0 if unknown
    , text                       :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , is_private                 :: Maybe Bool                        -- ^ True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone are able to see them
    , is_saved                   :: Maybe Bool                        -- ^ True, if the gift is displayed on the user's profile page; only for the receiver of the gift
    , can_be_upgraded            :: Maybe Bool                        -- ^ True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift
    , can_be_transferred         :: Maybe Bool                        -- ^ True, if the gift is an upgraded gift that can be transferred to another user; only for the receiver of the gift
    , was_refunded               :: Maybe Bool                        -- ^ True, if the gift was refunded and isn't available anymore
    , date                       :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift was sent
    , gift                       :: Maybe SentGift.SentGift           -- ^ The gift
    , message_id                 :: Maybe Int                         -- ^ Identifier of the message with the gift in the chat with the sender of the gift; can be 0 or an identifier of a deleted message; only for the receiver of the gift
    , sell_star_count            :: Maybe Int                         -- ^ Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user
    , prepaid_upgrade_star_count :: Maybe Int                         -- ^ Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
    , transfer_star_count        :: Maybe Int                         -- ^ Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
    , export_date                :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the upgraded gift can be transferred to TON blockchain as an NFT; 0 if NFT export isn't possible; only for the receiver of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow UserGift where
  shortShow UserGift
    { sender_user_id             = sender_user_id_
    , text                       = text_
    , is_private                 = is_private_
    , is_saved                   = is_saved_
    , can_be_upgraded            = can_be_upgraded_
    , can_be_transferred         = can_be_transferred_
    , was_refunded               = was_refunded_
    , date                       = date_
    , gift                       = gift_
    , message_id                 = message_id_
    , sell_star_count            = sell_star_count_
    , prepaid_upgrade_star_count = prepaid_upgrade_star_count_
    , transfer_star_count        = transfer_star_count_
    , export_date                = export_date_
    }
      = "UserGift"
        ++ I.cc
        [ "sender_user_id"             `I.p` sender_user_id_
        , "text"                       `I.p` text_
        , "is_private"                 `I.p` is_private_
        , "is_saved"                   `I.p` is_saved_
        , "can_be_upgraded"            `I.p` can_be_upgraded_
        , "can_be_transferred"         `I.p` can_be_transferred_
        , "was_refunded"               `I.p` was_refunded_
        , "date"                       `I.p` date_
        , "gift"                       `I.p` gift_
        , "message_id"                 `I.p` message_id_
        , "sell_star_count"            `I.p` sell_star_count_
        , "prepaid_upgrade_star_count" `I.p` prepaid_upgrade_star_count_
        , "transfer_star_count"        `I.p` transfer_star_count_
        , "export_date"                `I.p` export_date_
        ]

instance AT.FromJSON UserGift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userGift" -> parseUserGift v
      _          -> mempty
    
    where
      parseUserGift :: A.Value -> AT.Parser UserGift
      parseUserGift = A.withObject "UserGift" $ \o -> do
        sender_user_id_             <- o A..:?  "sender_user_id"
        text_                       <- o A..:?  "text"
        is_private_                 <- o A..:?  "is_private"
        is_saved_                   <- o A..:?  "is_saved"
        can_be_upgraded_            <- o A..:?  "can_be_upgraded"
        can_be_transferred_         <- o A..:?  "can_be_transferred"
        was_refunded_               <- o A..:?  "was_refunded"
        date_                       <- o A..:?  "date"
        gift_                       <- o A..:?  "gift"
        message_id_                 <- o A..:?  "message_id"
        sell_star_count_            <- o A..:?  "sell_star_count"
        prepaid_upgrade_star_count_ <- o A..:?  "prepaid_upgrade_star_count"
        transfer_star_count_        <- o A..:?  "transfer_star_count"
        export_date_                <- o A..:?  "export_date"
        pure $ UserGift
          { sender_user_id             = sender_user_id_
          , text                       = text_
          , is_private                 = is_private_
          , is_saved                   = is_saved_
          , can_be_upgraded            = can_be_upgraded_
          , can_be_transferred         = can_be_transferred_
          , was_refunded               = was_refunded_
          , date                       = date_
          , gift                       = gift_
          , message_id                 = message_id_
          , sell_star_count            = sell_star_count_
          , prepaid_upgrade_star_count = prepaid_upgrade_star_count_
          , transfer_star_count        = transfer_star_count_
          , export_date                = export_date_
          }
  parseJSON _ = mempty

