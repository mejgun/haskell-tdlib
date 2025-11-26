module TD.Data.PublicPostSearchLimits
  (PublicPostSearchLimits(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data PublicPostSearchLimits
  = PublicPostSearchLimits -- ^ Contains information about public post search limits
    { daily_free_query_count     :: Maybe Int  -- ^ Number of queries that can be sent daily for free
    , remaining_free_query_count :: Maybe Int  -- ^ Number of remaining free queries today
    , next_free_query_in         :: Maybe Int  -- ^ Amount of time till the next free query can be sent; 0 if it can be sent now
    , star_count                 :: Maybe Int  -- ^ Number of Telegram Stars that must be paid for each non-free query
    , is_current_query_free      :: Maybe Bool -- ^ True, if the search for the specified query isn't charged
    }
  deriving (Eq, Show)

instance I.ShortShow PublicPostSearchLimits where
  shortShow PublicPostSearchLimits
    { daily_free_query_count     = daily_free_query_count_
    , remaining_free_query_count = remaining_free_query_count_
    , next_free_query_in         = next_free_query_in_
    , star_count                 = star_count_
    , is_current_query_free      = is_current_query_free_
    }
      = "PublicPostSearchLimits"
        ++ I.cc
        [ "daily_free_query_count"     `I.p` daily_free_query_count_
        , "remaining_free_query_count" `I.p` remaining_free_query_count_
        , "next_free_query_in"         `I.p` next_free_query_in_
        , "star_count"                 `I.p` star_count_
        , "is_current_query_free"      `I.p` is_current_query_free_
        ]

instance AT.FromJSON PublicPostSearchLimits where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "publicPostSearchLimits" -> parsePublicPostSearchLimits v
      _                        -> mempty
    
    where
      parsePublicPostSearchLimits :: A.Value -> AT.Parser PublicPostSearchLimits
      parsePublicPostSearchLimits = A.withObject "PublicPostSearchLimits" $ \o -> do
        daily_free_query_count_     <- o A..:?  "daily_free_query_count"
        remaining_free_query_count_ <- o A..:?  "remaining_free_query_count"
        next_free_query_in_         <- o A..:?  "next_free_query_in"
        star_count_                 <- o A..:?  "star_count"
        is_current_query_free_      <- o A..:?  "is_current_query_free"
        pure $ PublicPostSearchLimits
          { daily_free_query_count     = daily_free_query_count_
          , remaining_free_query_count = remaining_free_query_count_
          , next_free_query_in         = next_free_query_in_
          , star_count                 = star_count_
          , is_current_query_free      = is_current_query_free_
          }
  parseJSON _ = mempty

