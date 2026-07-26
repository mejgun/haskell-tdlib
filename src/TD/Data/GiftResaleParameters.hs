module TD.Data.GiftResaleParameters
  (GiftResaleParameters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GiftResaleParameters
  = GiftResaleParameters -- ^ Describes parameters of a unique gift available for resale
    { star_count      :: Maybe Int  -- ^ Resale price of the gift in Telegram Stars
    , gram_cent_count :: Maybe Int  -- ^ Resale price of the gift in 1/100 of TON Gram
    , gram_only       :: Maybe Bool -- ^ True, if the gift can be bought only using Grams
    }
  deriving (Eq, Show)

instance I.ShortShow GiftResaleParameters where
  shortShow GiftResaleParameters
    { star_count      = star_count_
    , gram_cent_count = gram_cent_count_
    , gram_only       = gram_only_
    }
      = "GiftResaleParameters"
        ++ I.cc
        [ "star_count"      `I.p` star_count_
        , "gram_cent_count" `I.p` gram_cent_count_
        , "gram_only"       `I.p` gram_only_
        ]

instance AT.FromJSON GiftResaleParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftResaleParameters" -> parseGiftResaleParameters v
      _                      -> mempty
    
    where
      parseGiftResaleParameters :: A.Value -> AT.Parser GiftResaleParameters
      parseGiftResaleParameters = A.withObject "GiftResaleParameters" $ \o -> do
        star_count_      <- o A..:?  "star_count"
        gram_cent_count_ <- o A..:?  "gram_cent_count"
        gram_only_       <- o A..:?  "gram_only"
        pure $ GiftResaleParameters
          { star_count      = star_count_
          , gram_cent_count = gram_cent_count_
          , gram_only       = gram_only_
          }
  parseJSON _ = mempty

