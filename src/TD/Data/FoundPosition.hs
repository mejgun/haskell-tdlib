module TD.Data.FoundPosition
  (FoundPosition(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data FoundPosition
  = FoundPosition -- ^ Contains 0-based match position
    { position :: Maybe Int -- ^ The position of the match
    }
  deriving (Eq, Show)

instance I.ShortShow FoundPosition where
  shortShow FoundPosition
    { position = position_
    }
      = "FoundPosition"
        ++ I.cc
        [ "position" `I.p` position_
        ]

instance AT.FromJSON FoundPosition where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundPosition" -> parseFoundPosition v
      _               -> mempty
    
    where
      parseFoundPosition :: A.Value -> AT.Parser FoundPosition
      parseFoundPosition = A.withObject "FoundPosition" $ \o -> do
        position_ <- o A..:?  "position"
        pure $ FoundPosition
          { position = position_
          }
  parseJSON _ = mempty

