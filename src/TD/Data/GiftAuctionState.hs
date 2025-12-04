module TD.Data.GiftAuctionState
  (GiftAuctionState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Gift as Gift
import qualified TD.Data.AuctionState as AuctionState

data GiftAuctionState
  = GiftAuctionState -- ^ Represent auction state of a gift
    { gift  :: Maybe Gift.Gift                 -- ^ The gift
    , state :: Maybe AuctionState.AuctionState -- ^ Auction state of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GiftAuctionState where
  shortShow GiftAuctionState
    { gift  = gift_
    , state = state_
    }
      = "GiftAuctionState"
        ++ I.cc
        [ "gift"  `I.p` gift_
        , "state" `I.p` state_
        ]

instance AT.FromJSON GiftAuctionState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftAuctionState" -> parseGiftAuctionState v
      _                  -> mempty
    
    where
      parseGiftAuctionState :: A.Value -> AT.Parser GiftAuctionState
      parseGiftAuctionState = A.withObject "GiftAuctionState" $ \o -> do
        gift_  <- o A..:?  "gift"
        state_ <- o A..:?  "state"
        pure $ GiftAuctionState
          { gift  = gift_
          , state = state_
          }
  parseJSON _ = mempty

