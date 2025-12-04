module TD.Data.AuctionBid
  (AuctionBid(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AuctionBid
  = AuctionBid -- ^ Describes a bid in an auction
    { star_count :: Maybe Int -- ^ The number of Telegram Stars that were put in the bid
    , bid_date   :: Maybe Int -- ^ Point in time (Unix timestamp) when the bid was made
    , position   :: Maybe Int -- ^ Position of the bid in the list of all bids
    }
  deriving (Eq, Show)

instance I.ShortShow AuctionBid where
  shortShow AuctionBid
    { star_count = star_count_
    , bid_date   = bid_date_
    , position   = position_
    }
      = "AuctionBid"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        , "bid_date"   `I.p` bid_date_
        , "position"   `I.p` position_
        ]

instance AT.FromJSON AuctionBid where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "auctionBid" -> parseAuctionBid v
      _            -> mempty
    
    where
      parseAuctionBid :: A.Value -> AT.Parser AuctionBid
      parseAuctionBid = A.withObject "AuctionBid" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        bid_date_   <- o A..:?  "bid_date"
        position_   <- o A..:?  "position"
        pure $ AuctionBid
          { star_count = star_count_
          , bid_date   = bid_date_
          , position   = position_
          }
  parseJSON _ = mempty

