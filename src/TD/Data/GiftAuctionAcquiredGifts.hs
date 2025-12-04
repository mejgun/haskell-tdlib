module TD.Data.GiftAuctionAcquiredGifts
  (GiftAuctionAcquiredGifts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftAuctionAcquiredGift as GiftAuctionAcquiredGift

data GiftAuctionAcquiredGifts
  = GiftAuctionAcquiredGifts -- ^ Represents a list of gifts that were acquired by the current user on an auction
    { gifts :: Maybe [GiftAuctionAcquiredGift.GiftAuctionAcquiredGift] -- ^ The list of acquired gifts
    }
  deriving (Eq, Show)

instance I.ShortShow GiftAuctionAcquiredGifts where
  shortShow GiftAuctionAcquiredGifts
    { gifts = gifts_
    }
      = "GiftAuctionAcquiredGifts"
        ++ I.cc
        [ "gifts" `I.p` gifts_
        ]

instance AT.FromJSON GiftAuctionAcquiredGifts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftAuctionAcquiredGifts" -> parseGiftAuctionAcquiredGifts v
      _                          -> mempty
    
    where
      parseGiftAuctionAcquiredGifts :: A.Value -> AT.Parser GiftAuctionAcquiredGifts
      parseGiftAuctionAcquiredGifts = A.withObject "GiftAuctionAcquiredGifts" $ \o -> do
        gifts_ <- o A..:?  "gifts"
        pure $ GiftAuctionAcquiredGifts
          { gifts = gifts_
          }
  parseJSON _ = mempty

