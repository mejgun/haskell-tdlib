module TD.Query.GiftPremiumWithStars
  (GiftPremiumWithStars(..)
  , defaultGiftPremiumWithStars
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Allows to buy a Telegram Premium subscription for another user with payment in Telegram Stars; for bots only. Returns 'TD.Data.Ok.Ok'
data GiftPremiumWithStars
  = GiftPremiumWithStars
    { user_id     :: Maybe Int                         -- ^ Identifier of the user which will receive Telegram Premium
    , star_count  :: Maybe Int                         -- ^ The number of Telegram Stars to pay for subscription
    , month_count :: Maybe Int                         -- ^ Number of months the Telegram Premium subscription will be active for the user
    , text        :: Maybe FormattedText.FormattedText -- ^ Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed
    }
  deriving (Eq, Show)

instance I.ShortShow GiftPremiumWithStars where
  shortShow
    GiftPremiumWithStars
      { user_id     = user_id_
      , star_count  = star_count_
      , month_count = month_count_
      , text        = text_
      }
        = "GiftPremiumWithStars"
          ++ I.cc
          [ "user_id"     `I.p` user_id_
          , "star_count"  `I.p` star_count_
          , "month_count" `I.p` month_count_
          , "text"        `I.p` text_
          ]

instance AT.ToJSON GiftPremiumWithStars where
  toJSON
    GiftPremiumWithStars
      { user_id     = user_id_
      , star_count  = star_count_
      , month_count = month_count_
      , text        = text_
      }
        = A.object
          [ "@type"       A..= AT.String "giftPremiumWithStars"
          , "user_id"     A..= user_id_
          , "star_count"  A..= star_count_
          , "month_count" A..= month_count_
          , "text"        A..= text_
          ]

defaultGiftPremiumWithStars :: GiftPremiumWithStars
defaultGiftPremiumWithStars =
  GiftPremiumWithStars
    { user_id     = Nothing
    , star_count  = Nothing
    , month_count = Nothing
    , text        = Nothing
    }

