module TD.Data.VideoChatStream
  (VideoChatStream(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data VideoChatStream
  = VideoChatStream -- ^ Describes an available stream in a video chat
    { channel_id  :: Maybe Int -- ^ Identifier of an audio/video channel
    , scale       :: Maybe Int -- ^ Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
    , time_offset :: Maybe Int -- ^ Point in time when the stream currently ends; Unix timestamp in milliseconds
    }
  deriving (Eq, Show)

instance I.ShortShow VideoChatStream where
  shortShow VideoChatStream
    { channel_id  = channel_id_
    , scale       = scale_
    , time_offset = time_offset_
    }
      = "VideoChatStream"
        ++ I.cc
        [ "channel_id"  `I.p` channel_id_
        , "scale"       `I.p` scale_
        , "time_offset" `I.p` time_offset_
        ]

instance AT.FromJSON VideoChatStream where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoChatStream" -> parseVideoChatStream v
      _                 -> mempty
    
    where
      parseVideoChatStream :: A.Value -> AT.Parser VideoChatStream
      parseVideoChatStream = A.withObject "VideoChatStream" $ \o -> do
        channel_id_  <- o A..:?  "channel_id"
        scale_       <- o A..:?  "scale"
        time_offset_ <- o A..:?  "time_offset"
        pure $ VideoChatStream
          { channel_id  = channel_id_
          , scale       = scale_
          , time_offset = time_offset_
          }
  parseJSON _ = mempty

