module TD.Data.AuctionState
  (AuctionState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AuctionBid as AuctionBid
import qualified TD.Data.AuctionRound as AuctionRound
import qualified TD.Data.UserAuctionBid as UserAuctionBid
import qualified Data.Text as T

-- | Describes state of an auction
data AuctionState
  = AuctionStateActive -- ^ Contains information about an ongoing or scheduled auction
    { start_date             :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the auction started or will start
    , end_date               :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the auction will be ended
    , min_bid                :: Maybe Int                           -- ^ The minimum possible bid in the auction in Telegram Stars
    , bid_levels             :: Maybe [AuctionBid.AuctionBid]       -- ^ A sparse list of bids that were made in the auction
    , top_bidder_user_ids    :: Maybe [Int]                         -- ^ User identifiers of at most 3 users with the biggest bids
    , rounds                 :: Maybe [AuctionRound.AuctionRound]   -- ^ Rounds of the auction in which their duration or extension rules are changed
    , current_round_end_date :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the current round will end
    , current_round_number   :: Maybe Int                           -- ^ 1-based number of the current round
    , total_round_count      :: Maybe Int                           -- ^ The total number of rounds
    , distributed_item_count :: Maybe Int                           -- ^ The number of items that were purchased on the auction by all users
    , left_item_count        :: Maybe Int                           -- ^ The number of items that have to be distributed on the auction
    , acquired_item_count    :: Maybe Int                           -- ^ The number of items that were purchased by the current user on the auction
    , user_bid               :: Maybe UserAuctionBid.UserAuctionBid -- ^ Bid of the current user in the auction; may be null if none
    }
  | AuctionStateFinished -- ^ Contains information about a finished auction
    { start_date                 :: Maybe Int    -- ^ Point in time (Unix timestamp) when the auction started
    , end_date                   :: Maybe Int    -- ^ Point in time (Unix timestamp) when the auction will be ended
    , average_price              :: Maybe Int    -- ^ Average price of bought items in Telegram Stars
    , acquired_item_count        :: Maybe Int    -- ^ The number of items that were purchased by the current user on the auction
    , telegram_listed_item_count :: Maybe Int    -- ^ Number of items from the auction being resold on Telegram
    , fragment_listed_item_count :: Maybe Int    -- ^ Number of items from the auction being resold on Fragment
    , fragment_url               :: Maybe T.Text -- ^ The HTTPS link to the Fragment for the resold items; may be empty if there are no such items being sold on Fragment
    }
  deriving (Eq, Show)

instance I.ShortShow AuctionState where
  shortShow AuctionStateActive
    { start_date             = start_date_
    , end_date               = end_date_
    , min_bid                = min_bid_
    , bid_levels             = bid_levels_
    , top_bidder_user_ids    = top_bidder_user_ids_
    , rounds                 = rounds_
    , current_round_end_date = current_round_end_date_
    , current_round_number   = current_round_number_
    , total_round_count      = total_round_count_
    , distributed_item_count = distributed_item_count_
    , left_item_count        = left_item_count_
    , acquired_item_count    = acquired_item_count_
    , user_bid               = user_bid_
    }
      = "AuctionStateActive"
        ++ I.cc
        [ "start_date"             `I.p` start_date_
        , "end_date"               `I.p` end_date_
        , "min_bid"                `I.p` min_bid_
        , "bid_levels"             `I.p` bid_levels_
        , "top_bidder_user_ids"    `I.p` top_bidder_user_ids_
        , "rounds"                 `I.p` rounds_
        , "current_round_end_date" `I.p` current_round_end_date_
        , "current_round_number"   `I.p` current_round_number_
        , "total_round_count"      `I.p` total_round_count_
        , "distributed_item_count" `I.p` distributed_item_count_
        , "left_item_count"        `I.p` left_item_count_
        , "acquired_item_count"    `I.p` acquired_item_count_
        , "user_bid"               `I.p` user_bid_
        ]
  shortShow AuctionStateFinished
    { start_date                 = start_date_
    , end_date                   = end_date_
    , average_price              = average_price_
    , acquired_item_count        = acquired_item_count_
    , telegram_listed_item_count = telegram_listed_item_count_
    , fragment_listed_item_count = fragment_listed_item_count_
    , fragment_url               = fragment_url_
    }
      = "AuctionStateFinished"
        ++ I.cc
        [ "start_date"                 `I.p` start_date_
        , "end_date"                   `I.p` end_date_
        , "average_price"              `I.p` average_price_
        , "acquired_item_count"        `I.p` acquired_item_count_
        , "telegram_listed_item_count" `I.p` telegram_listed_item_count_
        , "fragment_listed_item_count" `I.p` fragment_listed_item_count_
        , "fragment_url"               `I.p` fragment_url_
        ]

instance AT.FromJSON AuctionState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "auctionStateActive"   -> parseAuctionStateActive v
      "auctionStateFinished" -> parseAuctionStateFinished v
      _                      -> mempty
    
    where
      parseAuctionStateActive :: A.Value -> AT.Parser AuctionState
      parseAuctionStateActive = A.withObject "AuctionStateActive" $ \o -> do
        start_date_             <- o A..:?  "start_date"
        end_date_               <- o A..:?  "end_date"
        min_bid_                <- o A..:?  "min_bid"
        bid_levels_             <- o A..:?  "bid_levels"
        top_bidder_user_ids_    <- o A..:?  "top_bidder_user_ids"
        rounds_                 <- o A..:?  "rounds"
        current_round_end_date_ <- o A..:?  "current_round_end_date"
        current_round_number_   <- o A..:?  "current_round_number"
        total_round_count_      <- o A..:?  "total_round_count"
        distributed_item_count_ <- o A..:?  "distributed_item_count"
        left_item_count_        <- o A..:?  "left_item_count"
        acquired_item_count_    <- o A..:?  "acquired_item_count"
        user_bid_               <- o A..:?  "user_bid"
        pure $ AuctionStateActive
          { start_date             = start_date_
          , end_date               = end_date_
          , min_bid                = min_bid_
          , bid_levels             = bid_levels_
          , top_bidder_user_ids    = top_bidder_user_ids_
          , rounds                 = rounds_
          , current_round_end_date = current_round_end_date_
          , current_round_number   = current_round_number_
          , total_round_count      = total_round_count_
          , distributed_item_count = distributed_item_count_
          , left_item_count        = left_item_count_
          , acquired_item_count    = acquired_item_count_
          , user_bid               = user_bid_
          }
      parseAuctionStateFinished :: A.Value -> AT.Parser AuctionState
      parseAuctionStateFinished = A.withObject "AuctionStateFinished" $ \o -> do
        start_date_                 <- o A..:?  "start_date"
        end_date_                   <- o A..:?  "end_date"
        average_price_              <- o A..:?  "average_price"
        acquired_item_count_        <- o A..:?  "acquired_item_count"
        telegram_listed_item_count_ <- o A..:?  "telegram_listed_item_count"
        fragment_listed_item_count_ <- o A..:?  "fragment_listed_item_count"
        fragment_url_               <- o A..:?  "fragment_url"
        pure $ AuctionStateFinished
          { start_date                 = start_date_
          , end_date                   = end_date_
          , average_price              = average_price_
          , acquired_item_count        = acquired_item_count_
          , telegram_listed_item_count = telegram_listed_item_count_
          , fragment_listed_item_count = fragment_listed_item_count_
          , fragment_url               = fragment_url_
          }
  parseJSON _ = mempty

