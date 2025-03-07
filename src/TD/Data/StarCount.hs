module TD.Data.StarCount
  (StarCount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StarCount
  = StarCount -- ^ Contains a number of Telegram Stars
    { star_count :: Maybe Int -- ^ Number of Telegram Stars
    }
  deriving (Eq, Show)

instance I.ShortShow StarCount where
  shortShow StarCount
    { star_count = star_count_
    }
      = "StarCount"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]

instance AT.FromJSON StarCount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starCount" -> parseStarCount v
      _           -> mempty
    
    where
      parseStarCount :: A.Value -> AT.Parser StarCount
      parseStarCount = A.withObject "StarCount" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ StarCount
          { star_count = star_count_
          }
  parseJSON _ = mempty

