module TD.Query.SendGiftPurchaseOffer
  (SendGiftPurchaseOffer(..)
  , defaultSendGiftPurchaseOffer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T
import qualified TD.Data.GiftResalePrice as GiftResalePrice

-- | Sends an offer to purchase an upgraded gift. Returns 'TD.Data.Ok.Ok'
data SendGiftPurchaseOffer
  = SendGiftPurchaseOffer
    { owner_id                :: Maybe MessageSender.MessageSender     -- ^ Identifier of the user or the channel chat that currently owns the gift and will receive the offer
    , gift_name               :: Maybe T.Text                          -- ^ Name of the upgraded gift
    , price                   :: Maybe GiftResalePrice.GiftResalePrice -- ^ The price that the user agreed to pay for the gift
    , duration                :: Maybe Int                             -- ^ Duration of the offer, in seconds; must be one of 21600, 43200, 86400, 129600, 172800, or 259200. Can also be 120 if Telegram test environment is used
    , paid_message_star_count :: Maybe Int                             -- ^ The number of Telegram Stars the user agreed to pay additionally for sending of the offer message to the current gift owner; pass userFullInfo.outgoing_paid_message_star_count for users and 0 otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow SendGiftPurchaseOffer where
  shortShow
    SendGiftPurchaseOffer
      { owner_id                = owner_id_
      , gift_name               = gift_name_
      , price                   = price_
      , duration                = duration_
      , paid_message_star_count = paid_message_star_count_
      }
        = "SendGiftPurchaseOffer"
          ++ I.cc
          [ "owner_id"                `I.p` owner_id_
          , "gift_name"               `I.p` gift_name_
          , "price"                   `I.p` price_
          , "duration"                `I.p` duration_
          , "paid_message_star_count" `I.p` paid_message_star_count_
          ]

instance AT.ToJSON SendGiftPurchaseOffer where
  toJSON
    SendGiftPurchaseOffer
      { owner_id                = owner_id_
      , gift_name               = gift_name_
      , price                   = price_
      , duration                = duration_
      , paid_message_star_count = paid_message_star_count_
      }
        = A.object
          [ "@type"                   A..= AT.String "sendGiftPurchaseOffer"
          , "owner_id"                A..= owner_id_
          , "gift_name"               A..= gift_name_
          , "price"                   A..= price_
          , "duration"                A..= duration_
          , "paid_message_star_count" A..= paid_message_star_count_
          ]

defaultSendGiftPurchaseOffer :: SendGiftPurchaseOffer
defaultSendGiftPurchaseOffer =
  SendGiftPurchaseOffer
    { owner_id                = Nothing
    , gift_name               = Nothing
    , price                   = Nothing
    , duration                = Nothing
    , paid_message_star_count = Nothing
    }

