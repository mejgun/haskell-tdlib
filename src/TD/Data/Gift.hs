module TD.Data.Gift
  (Gift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.GiftAuction as GiftAuction
import qualified TD.Data.GiftPurchaseLimits as GiftPurchaseLimits

data Gift
  = Gift -- ^ Describes a gift that can be sent to another user or channel chat
    { _id                     :: Maybe Int                                   -- ^ Unique identifier of the gift
    , publisher_chat_id       :: Maybe Int                                   -- ^ Identifier of the chat that published the gift; 0 if none
    , sticker                 :: Maybe Sticker.Sticker                       -- ^ The sticker representing the gift
    , star_count              :: Maybe Int                                   -- ^ Number of Telegram Stars that must be paid for the gift
    , default_sell_star_count :: Maybe Int                                   -- ^ Number of Telegram Stars that can be claimed by the receiver instead of the regular gift by default. If the gift was paid with just bought Telegram Stars, then full value can be claimed
    , upgrade_star_count      :: Maybe Int                                   -- ^ Number of Telegram Stars that must be paid to upgrade the gift; 0 if upgrade isn't possible
    , has_colors              :: Maybe Bool                                  -- ^ True, if the gift can be used to customize the user's name, and backgrounds of profile photo, reply header, and link preview
    , is_for_birthday         :: Maybe Bool                                  -- ^ True, if the gift is a birthday gift
    , is_premium              :: Maybe Bool                                  -- ^ True, if the gift can be bought only by Telegram Premium subscribers
    , auction_info            :: Maybe GiftAuction.GiftAuction               -- ^ Information about the auction on which the gift can be purchased; may be null if the gift can be purchased directly
    , next_send_date          :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the gift can be sent next time by the current user; can be 0 or a date in the past. If the date is in the future, then call canSendGift to get the reason, why the gift can't be sent now
    , user_limits             :: Maybe GiftPurchaseLimits.GiftPurchaseLimits -- ^ Number of times the gift can be purchased by the current user; may be null if not limited
    , overall_limits          :: Maybe GiftPurchaseLimits.GiftPurchaseLimits -- ^ Number of times the gift can be purchased all users; may be null if not limited
    , first_send_date         :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the gift was send for the first time; for sold out gifts only
    , last_send_date          :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the gift was send for the last time; for sold out gifts only
    }
  deriving (Eq, Show)

instance I.ShortShow Gift where
  shortShow Gift
    { _id                     = _id_
    , publisher_chat_id       = publisher_chat_id_
    , sticker                 = sticker_
    , star_count              = star_count_
    , default_sell_star_count = default_sell_star_count_
    , upgrade_star_count      = upgrade_star_count_
    , has_colors              = has_colors_
    , is_for_birthday         = is_for_birthday_
    , is_premium              = is_premium_
    , auction_info            = auction_info_
    , next_send_date          = next_send_date_
    , user_limits             = user_limits_
    , overall_limits          = overall_limits_
    , first_send_date         = first_send_date_
    , last_send_date          = last_send_date_
    }
      = "Gift"
        ++ I.cc
        [ "_id"                     `I.p` _id_
        , "publisher_chat_id"       `I.p` publisher_chat_id_
        , "sticker"                 `I.p` sticker_
        , "star_count"              `I.p` star_count_
        , "default_sell_star_count" `I.p` default_sell_star_count_
        , "upgrade_star_count"      `I.p` upgrade_star_count_
        , "has_colors"              `I.p` has_colors_
        , "is_for_birthday"         `I.p` is_for_birthday_
        , "is_premium"              `I.p` is_premium_
        , "auction_info"            `I.p` auction_info_
        , "next_send_date"          `I.p` next_send_date_
        , "user_limits"             `I.p` user_limits_
        , "overall_limits"          `I.p` overall_limits_
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
        publisher_chat_id_       <- o A..:?                       "publisher_chat_id"
        sticker_                 <- o A..:?                       "sticker"
        star_count_              <- o A..:?                       "star_count"
        default_sell_star_count_ <- o A..:?                       "default_sell_star_count"
        upgrade_star_count_      <- o A..:?                       "upgrade_star_count"
        has_colors_              <- o A..:?                       "has_colors"
        is_for_birthday_         <- o A..:?                       "is_for_birthday"
        is_premium_              <- o A..:?                       "is_premium"
        auction_info_            <- o A..:?                       "auction_info"
        next_send_date_          <- o A..:?                       "next_send_date"
        user_limits_             <- o A..:?                       "user_limits"
        overall_limits_          <- o A..:?                       "overall_limits"
        first_send_date_         <- o A..:?                       "first_send_date"
        last_send_date_          <- o A..:?                       "last_send_date"
        pure $ Gift
          { _id                     = _id_
          , publisher_chat_id       = publisher_chat_id_
          , sticker                 = sticker_
          , star_count              = star_count_
          , default_sell_star_count = default_sell_star_count_
          , upgrade_star_count      = upgrade_star_count_
          , has_colors              = has_colors_
          , is_for_birthday         = is_for_birthday_
          , is_premium              = is_premium_
          , auction_info            = auction_info_
          , next_send_date          = next_send_date_
          , user_limits             = user_limits_
          , overall_limits          = overall_limits_
          , first_send_date         = first_send_date_
          , last_send_date          = last_send_date_
          }
  parseJSON _ = mempty

