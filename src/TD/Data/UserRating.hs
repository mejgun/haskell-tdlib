module TD.Data.UserRating
  (UserRating(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data UserRating
  = UserRating -- ^ Contains description of user rating
    { level                    :: Maybe Int  -- ^ The level of the user; may be negative
    , is_maximum_level_reached :: Maybe Bool -- ^ True, if the maximum level is reached
    , rating                   :: Maybe Int  -- ^ Numerical value of the rating
    , current_level_rating     :: Maybe Int  -- ^ The rating required for the current level
    , next_level_rating        :: Maybe Int  -- ^ The rating required for the next level; 0 if the maximum level is reached
    }
  deriving (Eq, Show)

instance I.ShortShow UserRating where
  shortShow UserRating
    { level                    = level_
    , is_maximum_level_reached = is_maximum_level_reached_
    , rating                   = rating_
    , current_level_rating     = current_level_rating_
    , next_level_rating        = next_level_rating_
    }
      = "UserRating"
        ++ I.cc
        [ "level"                    `I.p` level_
        , "is_maximum_level_reached" `I.p` is_maximum_level_reached_
        , "rating"                   `I.p` rating_
        , "current_level_rating"     `I.p` current_level_rating_
        , "next_level_rating"        `I.p` next_level_rating_
        ]

instance AT.FromJSON UserRating where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userRating" -> parseUserRating v
      _            -> mempty
    
    where
      parseUserRating :: A.Value -> AT.Parser UserRating
      parseUserRating = A.withObject "UserRating" $ \o -> do
        level_                    <- o A..:?  "level"
        is_maximum_level_reached_ <- o A..:?  "is_maximum_level_reached"
        rating_                   <- o A..:?  "rating"
        current_level_rating_     <- o A..:?  "current_level_rating"
        next_level_rating_        <- o A..:?  "next_level_rating"
        pure $ UserRating
          { level                    = level_
          , is_maximum_level_reached = is_maximum_level_reached_
          , rating                   = rating_
          , current_level_rating     = current_level_rating_
          , next_level_rating        = next_level_rating_
          }
  parseJSON _ = mempty

