module TD.Data.GroupCallStreams
  (GroupCallStreams(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallStream as GroupCallStream

data GroupCallStreams
  = GroupCallStreams -- ^ Represents a list of group call streams
    { streams :: Maybe [GroupCallStream.GroupCallStream] -- ^ A list of group call streams
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallStreams where
  shortShow GroupCallStreams
    { streams = streams_
    }
      = "GroupCallStreams"
        ++ I.cc
        [ "streams" `I.p` streams_
        ]

instance AT.FromJSON GroupCallStreams where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallStreams" -> parseGroupCallStreams v
      _                  -> mempty
    
    where
      parseGroupCallStreams :: A.Value -> AT.Parser GroupCallStreams
      parseGroupCallStreams = A.withObject "GroupCallStreams" $ \o -> do
        streams_ <- o A..:?  "streams"
        pure $ GroupCallStreams
          { streams = streams_
          }
  parseJSON _ = mempty

