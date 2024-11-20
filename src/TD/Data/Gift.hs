module TD.Data.Gift
  (Gift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker

data Gift
  = Gift -- ^ Describes a gift that can be sent to another user
    { _id                     :: Maybe Int             -- ^ Unique identifier of the gift
    , sticker                 :: Maybe Sticker.Sticker -- ^ The sticker representing the gift
    , star_count              :: Maybe Int             -- ^ Number of Telegram Stars that must be paid for the gift
    , default_sell_star_count :: Maybe Int             -- ^ Number of Telegram Stars that can be claimed by the receiver instead of the gift by default. If the gift was paid with just bought Telegram Stars, then full value can be claimed
    , is_for_birthday         :: Maybe Bool            -- ^ True, if the gift is a birthday gift
    , remaining_count         :: Maybe Int             -- ^ Number of remaining times the gift can be purchased by all users; 0 if not limited or the gift was sold out
    , total_count             :: Maybe Int             -- ^ Number of total times the gift can be purchased by all users; 0 if not limited
    , first_send_date         :: Maybe Int             -- ^ Point in time (Unix timestamp) when the gift was send for the first time; for sold out gifts only
    , last_send_date          :: Maybe Int             -- ^ Point in time (Unix timestamp) when the gift was send for the last time; for sold out gifts only
    }
  deriving (Eq, Show)

instance I.ShortShow Gift where
  shortShow Gift
    { _id                     = _id_
    , sticker                 = sticker_
    , star_count              = star_count_
    , default_sell_star_count = default_sell_star_count_
    , is_for_birthday         = is_for_birthday_
    , remaining_count         = remaining_count_
    , total_count             = total_count_
    , first_send_date         = first_send_date_
    , last_send_date          = last_send_date_
    }
      = "Gift"
        ++ I.cc
        [ "_id"                     `I.p` _id_
        , "sticker"                 `I.p` sticker_
        , "star_count"              `I.p` star_count_
        , "default_sell_star_count" `I.p` default_sell_star_count_
        , "is_for_birthday"         `I.p` is_for_birthday_
        , "remaining_count"         `I.p` remaining_count_
        , "total_count"             `I.p` total_count_
        , "first_send_date"         `I.p` first_send_date_
        , "last_send_date"          `I.p` last_send_date_
        ]

instance AT.FromJSON Gift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "gift" -> parseGift v
      _      -> mempty
    
    where
      parseGift :: A.Value -> AT.Parser Gift
      parseGift = A.withObject "Gift" $ \o -> do
        _id_                     <- fmap I.readInt64 <$> o A..:?  "id"
        sticker_                 <- o A..:?                       "sticker"
        star_count_              <- o A..:?                       "star_count"
        default_sell_star_count_ <- o A..:?                       "default_sell_star_count"
        is_for_birthday_         <- o A..:?                       "is_for_birthday"
        remaining_count_         <- o A..:?                       "remaining_count"
        total_count_             <- o A..:?                       "total_count"
        first_send_date_         <- o A..:?                       "first_send_date"
        last_send_date_          <- o A..:?                       "last_send_date"
        pure $ Gift
          { _id                     = _id_
          , sticker                 = sticker_
          , star_count              = star_count_
          , default_sell_star_count = default_sell_star_count_
          , is_for_birthday         = is_for_birthday_
          , remaining_count         = remaining_count_
          , total_count             = total_count_
          , first_send_date         = first_send_date_
          , last_send_date          = last_send_date_
          }
  parseJSON _ = mempty

