module TD.Data.VideoChatStreams
  (VideoChatStreams(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.VideoChatStream as VideoChatStream

data VideoChatStreams
  = VideoChatStreams -- ^ Represents a list of video chat streams
    { streams :: Maybe [VideoChatStream.VideoChatStream] -- ^ A list of video chat streams
    }
  deriving (Eq, Show)

instance I.ShortShow VideoChatStreams where
  shortShow VideoChatStreams
    { streams = streams_
    }
      = "VideoChatStreams"
        ++ I.cc
        [ "streams" `I.p` streams_
        ]

instance AT.FromJSON VideoChatStreams where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoChatStreams" -> parseVideoChatStreams v
      _                  -> mempty
    
    where
      parseVideoChatStreams :: A.Value -> AT.Parser VideoChatStreams
      parseVideoChatStreams = A.withObject "VideoChatStreams" $ \o -> do
        streams_ <- o A..:?  "streams"
        pure $ VideoChatStreams
          { streams = streams_
          }
  parseJSON _ = mempty

