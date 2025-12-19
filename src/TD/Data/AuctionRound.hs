module TD.Data.AuctionRound
  (AuctionRound(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AuctionRound
  = AuctionRound -- ^ Describes a round of an auction
    { number           :: Maybe Int -- ^ 1-based number of the round
    , duration         :: Maybe Int -- ^ Duration of the round, in seconds
    , extend_time      :: Maybe Int -- ^ The number of seconds for which the round will be extended if there are changes in the top winners
    , top_winner_count :: Maybe Int -- ^ The number of top winners who trigger round extension if changed
    }
  deriving (Eq, Show)

instance I.ShortShow AuctionRound where
  shortShow AuctionRound
    { number           = number_
    , duration         = duration_
    , extend_time      = extend_time_
    , top_winner_count = top_winner_count_
    }
      = "AuctionRound"
        ++ I.cc
        [ "number"           `I.p` number_
        , "duration"         `I.p` duration_
        , "extend_time"      `I.p` extend_time_
        , "top_winner_count" `I.p` top_winner_count_
        ]

instance AT.FromJSON AuctionRound where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "auctionRound" -> parseAuctionRound v
      _              -> mempty
    
    where
      parseAuctionRound :: A.Value -> AT.Parser AuctionRound
      parseAuctionRound = A.withObject "AuctionRound" $ \o -> do
        number_           <- o A..:?  "number"
        duration_         <- o A..:?  "duration"
        extend_time_      <- o A..:?  "extend_time"
        top_winner_count_ <- o A..:?  "top_winner_count"
        pure $ AuctionRound
          { number           = number_
          , duration         = duration_
          , extend_time      = extend_time_
          , top_winner_count = top_winner_count_
          }
  parseJSON _ = mempty

