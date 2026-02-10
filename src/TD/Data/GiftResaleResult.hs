module TD.Data.GiftResaleResult
  (GiftResaleResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.GiftResalePrice as GiftResalePrice

-- | Describes result of sending a resold gift
data GiftResaleResult
  = GiftResaleResultOk -- ^ Operation was successfully completed
    { received_gift_id :: Maybe T.Text -- ^ Unique identifier of the received gift; only for the gifts sent to the current user
    }
  | GiftResaleResultPriceIncreased -- ^ Operation has failed, because price has increased. If the price has decreased, then the buying will succeed anyway
    { price :: Maybe GiftResalePrice.GiftResalePrice -- ^ New price for the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GiftResaleResult where
  shortShow GiftResaleResultOk
    { received_gift_id = received_gift_id_
    }
      = "GiftResaleResultOk"
        ++ I.cc
        [ "received_gift_id" `I.p` received_gift_id_
        ]
  shortShow GiftResaleResultPriceIncreased
    { price = price_
    }
      = "GiftResaleResultPriceIncreased"
        ++ I.cc
        [ "price" `I.p` price_
        ]

instance AT.FromJSON GiftResaleResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftResaleResultOk"             -> parseGiftResaleResultOk v
      "giftResaleResultPriceIncreased" -> parseGiftResaleResultPriceIncreased v
      _                                -> mempty
    
    where
      parseGiftResaleResultOk :: A.Value -> AT.Parser GiftResaleResult
      parseGiftResaleResultOk = A.withObject "GiftResaleResultOk" $ \o -> do
        received_gift_id_ <- o A..:?  "received_gift_id"
        pure $ GiftResaleResultOk
          { received_gift_id = received_gift_id_
          }
      parseGiftResaleResultPriceIncreased :: A.Value -> AT.Parser GiftResaleResult
      parseGiftResaleResultPriceIncreased = A.withObject "GiftResaleResultPriceIncreased" $ \o -> do
        price_ <- o A..:?  "price"
        pure $ GiftResaleResultPriceIncreased
          { price = price_
          }
  parseJSON _ = mempty

