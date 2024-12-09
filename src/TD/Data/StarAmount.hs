module TD.Data.StarAmount
  (StarAmount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StarAmount
  = StarAmount -- ^ Describes a possibly non-integer amount of Telegram Stars
    { star_count     :: Maybe Int -- ^ The integer amount of Telegram Stars rounded to 0
    , nanostar_count :: Maybe Int -- ^ The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999
    }
  deriving (Eq, Show)

instance I.ShortShow StarAmount where
  shortShow StarAmount
    { star_count     = star_count_
    , nanostar_count = nanostar_count_
    }
      = "StarAmount"
        ++ I.cc
        [ "star_count"     `I.p` star_count_
        , "nanostar_count" `I.p` nanostar_count_
        ]

instance AT.FromJSON StarAmount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starAmount" -> parseStarAmount v
      _            -> mempty
    
    where
      parseStarAmount :: A.Value -> AT.Parser StarAmount
      parseStarAmount = A.withObject "StarAmount" $ \o -> do
        star_count_     <- o A..:?  "star_count"
        nanostar_count_ <- o A..:?  "nanostar_count"
        pure $ StarAmount
          { star_count     = star_count_
          , nanostar_count = nanostar_count_
          }
  parseJSON _ = mempty

