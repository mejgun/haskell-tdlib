module TD.Data.GroupCallStreams where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallStream as GroupCallStream

data GroupCallStreams
  = GroupCallStreams -- ^ Represents a list of group call streams
    { streams :: Maybe [GroupCallStream.GroupCallStream] -- ^ A list of group call streams
    }
  deriving (Eq)

instance Show GroupCallStreams where
  show GroupCallStreams
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

instance AT.ToJSON GroupCallStreams where
  toJSON GroupCallStreams
    { streams = streams_
    }
      = A.object
        [ "@type"   A..= AT.String "groupCallStreams"
        , "streams" A..= streams_
        ]
