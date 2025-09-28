module TD.Data.GiftPurchaseLimits
  (GiftPurchaseLimits(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GiftPurchaseLimits
  = GiftPurchaseLimits -- ^ Describes the maximum number of times that a specific gift can be purchased
    { total_count     :: Maybe Int -- ^ The maximum number of times the gifts can be purchased
    , remaining_count :: Maybe Int -- ^ Number of remaining times the gift can be purchased
    }
  deriving (Eq, Show)

instance I.ShortShow GiftPurchaseLimits where
  shortShow GiftPurchaseLimits
    { total_count     = total_count_
    , remaining_count = remaining_count_
    }
      = "GiftPurchaseLimits"
        ++ I.cc
        [ "total_count"     `I.p` total_count_
        , "remaining_count" `I.p` remaining_count_
        ]

instance AT.FromJSON GiftPurchaseLimits where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftPurchaseLimits" -> parseGiftPurchaseLimits v
      _                    -> mempty
    
    where
      parseGiftPurchaseLimits :: A.Value -> AT.Parser GiftPurchaseLimits
      parseGiftPurchaseLimits = A.withObject "GiftPurchaseLimits" $ \o -> do
        total_count_     <- o A..:?  "total_count"
        remaining_count_ <- o A..:?  "remaining_count"
        pure $ GiftPurchaseLimits
          { total_count     = total_count_
          , remaining_count = remaining_count_
          }
  parseJSON _ = mempty

