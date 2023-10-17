module TD.Data.FoundPositions
  (FoundPositions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data FoundPositions
  = FoundPositions -- ^ Contains 0-based positions of matched objects
    { total_count :: Maybe Int   -- ^ Total number of matched objects
    , positions   :: Maybe [Int] -- ^ The positions of the matched objects
    }
  deriving (Eq, Show)

instance I.ShortShow FoundPositions where
  shortShow FoundPositions
    { total_count = total_count_
    , positions   = positions_
    }
      = "FoundPositions"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "positions"   `I.p` positions_
        ]

instance AT.FromJSON FoundPositions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundPositions" -> parseFoundPositions v
      _                -> mempty
    
    where
      parseFoundPositions :: A.Value -> AT.Parser FoundPositions
      parseFoundPositions = A.withObject "FoundPositions" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        positions_   <- o A..:?  "positions"
        pure $ FoundPositions
          { total_count = total_count_
          , positions   = positions_
          }
  parseJSON _ = mempty

