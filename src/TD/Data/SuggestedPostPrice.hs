module TD.Data.SuggestedPostPrice
  (SuggestedPostPrice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes price of a suggested post
data SuggestedPostPrice
  = SuggestedPostPriceStar -- ^ Describes price of a suggested post in Telegram Stars
    { star_count :: Maybe Int -- ^ The amount of Telegram Stars agreed to pay for the post; getOption("suggested_post_star_count_min")-getOption("suggested_post_star_count_max")
    }
  | SuggestedPostPriceTon -- ^ Describes price of a suggested post in Toncoins
    { toncoin_cent_count :: Maybe Int -- ^ The amount of 1/100 of Toncoin agreed to pay for the post; getOption("suggested_post_toncoin_cent_count_min")-getOption("suggested_post_toncoin_cent_count_max")
    }
  deriving (Eq, Show)

instance I.ShortShow SuggestedPostPrice where
  shortShow SuggestedPostPriceStar
    { star_count = star_count_
    }
      = "SuggestedPostPriceStar"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]
  shortShow SuggestedPostPriceTon
    { toncoin_cent_count = toncoin_cent_count_
    }
      = "SuggestedPostPriceTon"
        ++ I.cc
        [ "toncoin_cent_count" `I.p` toncoin_cent_count_
        ]

instance AT.FromJSON SuggestedPostPrice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "suggestedPostPriceStar" -> parseSuggestedPostPriceStar v
      "suggestedPostPriceTon"  -> parseSuggestedPostPriceTon v
      _                        -> mempty
    
    where
      parseSuggestedPostPriceStar :: A.Value -> AT.Parser SuggestedPostPrice
      parseSuggestedPostPriceStar = A.withObject "SuggestedPostPriceStar" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ SuggestedPostPriceStar
          { star_count = star_count_
          }
      parseSuggestedPostPriceTon :: A.Value -> AT.Parser SuggestedPostPrice
      parseSuggestedPostPriceTon = A.withObject "SuggestedPostPriceTon" $ \o -> do
        toncoin_cent_count_ <- o A..:?  "toncoin_cent_count"
        pure $ SuggestedPostPriceTon
          { toncoin_cent_count = toncoin_cent_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON SuggestedPostPrice where
  toJSON SuggestedPostPriceStar
    { star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "suggestedPostPriceStar"
        , "star_count" A..= star_count_
        ]
  toJSON SuggestedPostPriceTon
    { toncoin_cent_count = toncoin_cent_count_
    }
      = A.object
        [ "@type"              A..= AT.String "suggestedPostPriceTon"
        , "toncoin_cent_count" A..= toncoin_cent_count_
        ]

