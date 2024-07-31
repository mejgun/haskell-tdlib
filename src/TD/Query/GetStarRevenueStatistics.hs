module TD.Query.GetStarRevenueStatistics
  (GetStarRevenueStatistics(..)
  , defaultGetStarRevenueStatistics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Returns detailed Telegram Star revenue statistics. Returns 'TD.Data.StarRevenueStatistics.StarRevenueStatistics'
data GetStarRevenueStatistics
  = GetStarRevenueStatistics
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true
    , is_dark  :: Maybe Bool                        -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarRevenueStatistics where
  shortShow
    GetStarRevenueStatistics
      { owner_id = owner_id_
      , is_dark  = is_dark_
      }
        = "GetStarRevenueStatistics"
          ++ I.cc
          [ "owner_id" `I.p` owner_id_
          , "is_dark"  `I.p` is_dark_
          ]

instance AT.ToJSON GetStarRevenueStatistics where
  toJSON
    GetStarRevenueStatistics
      { owner_id = owner_id_
      , is_dark  = is_dark_
      }
        = A.object
          [ "@type"    A..= AT.String "getStarRevenueStatistics"
          , "owner_id" A..= owner_id_
          , "is_dark"  A..= is_dark_
          ]

defaultGetStarRevenueStatistics :: GetStarRevenueStatistics
defaultGetStarRevenueStatistics =
  GetStarRevenueStatistics
    { owner_id = Nothing
    , is_dark  = Nothing
    }

