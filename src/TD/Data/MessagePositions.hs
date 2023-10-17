module TD.Data.MessagePositions
  (MessagePositions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessagePosition as MessagePosition

data MessagePositions
  = MessagePositions -- ^ Contains a list of message positions
    { total_count :: Maybe Int                               -- ^ Total number of messages found
    , positions   :: Maybe [MessagePosition.MessagePosition] -- ^ List of message positions
    }
  deriving (Eq, Show)

instance I.ShortShow MessagePositions where
  shortShow MessagePositions
    { total_count = total_count_
    , positions   = positions_
    }
      = "MessagePositions"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "positions"   `I.p` positions_
        ]

instance AT.FromJSON MessagePositions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messagePositions" -> parseMessagePositions v
      _                  -> mempty
    
    where
      parseMessagePositions :: A.Value -> AT.Parser MessagePositions
      parseMessagePositions = A.withObject "MessagePositions" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        positions_   <- o A..:?  "positions"
        pure $ MessagePositions
          { total_count = total_count_
          , positions   = positions_
          }
  parseJSON _ = mempty

