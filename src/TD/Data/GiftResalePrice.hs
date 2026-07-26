module TD.Data.GiftResalePrice
  (GiftResalePrice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes price of a resold gift
data GiftResalePrice
  = GiftResalePriceStar -- ^ Describes price of a resold gift in Telegram Stars
    { star_count :: Maybe Int -- ^ The Telegram Star amount expected to be paid for the gift. Must be in the range getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max") for gifts put for resale
    }
  | GiftResalePriceGram -- ^ Describes price of a resold gift in TON Grams
    { gram_cent_count :: Maybe Int -- ^ The amount of 1/100 of Gram expected to be paid for the gift. Must be in the range getOption("gift_resale_gram_cent_count_min")-getOption("gift_resale_gram_cent_count_max")
    }
  deriving (Eq, Show)

instance I.ShortShow GiftResalePrice where
  shortShow GiftResalePriceStar
    { star_count = star_count_
    }
      = "GiftResalePriceStar"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]
  shortShow GiftResalePriceGram
    { gram_cent_count = gram_cent_count_
    }
      = "GiftResalePriceGram"
        ++ I.cc
        [ "gram_cent_count" `I.p` gram_cent_count_
        ]

instance AT.FromJSON GiftResalePrice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftResalePriceStar" -> parseGiftResalePriceStar v
      "giftResalePriceGram" -> parseGiftResalePriceGram v
      _                     -> mempty
    
    where
      parseGiftResalePriceStar :: A.Value -> AT.Parser GiftResalePrice
      parseGiftResalePriceStar = A.withObject "GiftResalePriceStar" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ GiftResalePriceStar
          { star_count = star_count_
          }
      parseGiftResalePriceGram :: A.Value -> AT.Parser GiftResalePrice
      parseGiftResalePriceGram = A.withObject "GiftResalePriceGram" $ \o -> do
        gram_cent_count_ <- o A..:?  "gram_cent_count"
        pure $ GiftResalePriceGram
          { gram_cent_count = gram_cent_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON GiftResalePrice where
  toJSON GiftResalePriceStar
    { star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "giftResalePriceStar"
        , "star_count" A..= star_count_
        ]
  toJSON GiftResalePriceGram
    { gram_cent_count = gram_cent_count_
    }
      = A.object
        [ "@type"           A..= AT.String "giftResalePriceGram"
        , "gram_cent_count" A..= gram_cent_count_
        ]

