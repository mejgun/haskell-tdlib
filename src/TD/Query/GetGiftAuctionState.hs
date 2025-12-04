module TD.Query.GetGiftAuctionState
  (GetGiftAuctionState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns auction state for a gift. Returns 'TD.Data.GiftAuctionState.GiftAuctionState'
data GetGiftAuctionState
  = GetGiftAuctionState
    { auction_id :: Maybe T.Text -- ^ Unique identifier of the auction
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftAuctionState where
  shortShow
    GetGiftAuctionState
      { auction_id = auction_id_
      }
        = "GetGiftAuctionState"
          ++ I.cc
          [ "auction_id" `I.p` auction_id_
          ]

instance AT.ToJSON GetGiftAuctionState where
  toJSON
    GetGiftAuctionState
      { auction_id = auction_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getGiftAuctionState"
          , "auction_id" A..= auction_id_
          ]

