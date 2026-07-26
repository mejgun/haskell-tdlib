module TD.Data.SuggestedPostPrice
  (SuggestedPostPrice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes price of a suggested post
data SuggestedPostPrice
  = SuggestedPostPriceStar -- ^ Describes price of a suggested post in Telegram Stars
    { star_count :: Maybe Int -- ^ The Telegram Star amount expected to be paid for the post; getOption("suggested_post_star_count_min")-getOption("suggested_post_star_count_max")
    }
  | SuggestedPostPriceGram -- ^ Describes price of a suggested post in TON Grams
    { gram_cent_count :: Maybe Int -- ^ The amount of 1/100 of Gram expected to be paid for the post; getOption("suggested_post_gram_cent_count_min")-getOption("suggested_post_gram_cent_count_max")
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
  shortShow SuggestedPostPriceGram
    { gram_cent_count = gram_cent_count_
    }
      = "SuggestedPostPriceGram"
        ++ I.cc
        [ "gram_cent_count" `I.p` gram_cent_count_
        ]

instance AT.FromJSON SuggestedPostPrice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "suggestedPostPriceStar" -> parseSuggestedPostPriceStar v
      "suggestedPostPriceGram" -> parseSuggestedPostPriceGram v
      _                        -> mempty
    
    where
      parseSuggestedPostPriceStar :: A.Value -> AT.Parser SuggestedPostPrice
      parseSuggestedPostPriceStar = A.withObject "SuggestedPostPriceStar" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ SuggestedPostPriceStar
          { star_count = star_count_
          }
      parseSuggestedPostPriceGram :: A.Value -> AT.Parser SuggestedPostPrice
      parseSuggestedPostPriceGram = A.withObject "SuggestedPostPriceGram" $ \o -> do
        gram_cent_count_ <- o A..:?  "gram_cent_count"
        pure $ SuggestedPostPriceGram
          { gram_cent_count = gram_cent_count_
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
  toJSON SuggestedPostPriceGram
    { gram_cent_count = gram_cent_count_
    }
      = A.object
        [ "@type"           A..= AT.String "suggestedPostPriceGram"
        , "gram_cent_count" A..= gram_cent_count_
        ]

