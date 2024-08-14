module TD.Data.StarSubscriptionPricing
  ( StarSubscriptionPricing(..)    
  , defaultStarSubscriptionPricing 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StarSubscriptionPricing
  = StarSubscriptionPricing -- ^ Describes subscription plan paid in Telegram Stars
    { period     :: Maybe Int -- ^ The number of seconds between consecutive Telegram Star debiting
    , star_count :: Maybe Int -- ^ The amount of Telegram Stars that must be paid for each period
    }
  deriving (Eq, Show)

instance I.ShortShow StarSubscriptionPricing where
  shortShow StarSubscriptionPricing
    { period     = period_
    , star_count = star_count_
    }
      = "StarSubscriptionPricing"
        ++ I.cc
        [ "period"     `I.p` period_
        , "star_count" `I.p` star_count_
        ]

instance AT.FromJSON StarSubscriptionPricing where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starSubscriptionPricing" -> parseStarSubscriptionPricing v
      _                         -> mempty
    
    where
      parseStarSubscriptionPricing :: A.Value -> AT.Parser StarSubscriptionPricing
      parseStarSubscriptionPricing = A.withObject "StarSubscriptionPricing" $ \o -> do
        period_     <- o A..:?  "period"
        star_count_ <- o A..:?  "star_count"
        pure $ StarSubscriptionPricing
          { period     = period_
          , star_count = star_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON StarSubscriptionPricing where
  toJSON StarSubscriptionPricing
    { period     = period_
    , star_count = star_count_
    }
      = A.object
        [ "@type"      A..= AT.String "starSubscriptionPricing"
        , "period"     A..= period_
        , "star_count" A..= star_count_
        ]

defaultStarSubscriptionPricing :: StarSubscriptionPricing
defaultStarSubscriptionPricing =
  StarSubscriptionPricing
    { period     = Nothing
    , star_count = Nothing
    }

