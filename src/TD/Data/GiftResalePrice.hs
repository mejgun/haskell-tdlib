module TD.Data.GiftResalePrice
  (GiftResalePrice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes price of a resold gift
data GiftResalePrice
  = GiftResalePriceStar -- ^ Describes price of a resold gift in Telegram Stars
    { star_count :: Maybe Int -- ^ The amount of Telegram Stars expected to be paid for the gift. Must be in range getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max") for gifts put for resale
    }
  | GiftResalePriceTon -- ^ Describes price of a resold gift in Toncoins
    { toncoin_cent_count :: Maybe Int -- ^ The amount of 1/100 of Toncoin expected to be paid for the gift. Must be in range getOption("gift_resale_toncoin_cent_count_min")-getOption("gift_resale_toncoin_cent_count_max")
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
  shortShow GiftResalePriceTon
    { toncoin_cent_count = toncoin_cent_count_
    }
      = "GiftResalePriceTon"
        ++ I.cc
        [ "toncoin_cent_count" `I.p` toncoin_cent_count_
        ]

instance AT.FromJSON GiftResalePrice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftResalePriceStar" -> parseGiftResalePriceStar v
      "giftResalePriceTon"  -> parseGiftResalePriceTon v
      _                     -> mempty
    
    where
      parseGiftResalePriceStar :: A.Value -> AT.Parser GiftResalePrice
      parseGiftResalePriceStar = A.withObject "GiftResalePriceStar" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ GiftResalePriceStar
          { star_count = star_count_
          }
      parseGiftResalePriceTon :: A.Value -> AT.Parser GiftResalePrice
      parseGiftResalePriceTon = A.withObject "GiftResalePriceTon" $ \o -> do
        toncoin_cent_count_ <- o A..:?  "toncoin_cent_count"
        pure $ GiftResalePriceTon
          { toncoin_cent_count = toncoin_cent_count_
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
  toJSON GiftResalePriceTon
    { toncoin_cent_count = toncoin_cent_count_
    }
      = A.object
        [ "@type"              A..= AT.String "giftResalePriceTon"
        , "toncoin_cent_count" A..= toncoin_cent_count_
        ]

