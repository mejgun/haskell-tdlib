module TD.Data.GroupCallStream
  ( GroupCallStream(..)    
  , defaultGroupCallStream 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GroupCallStream
  = GroupCallStream -- ^ Describes an available stream in a group call
    { channel_id  :: Maybe Int -- ^ Identifier of an audio/video channel
    , scale       :: Maybe Int -- ^ Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
    , time_offset :: Maybe Int -- ^ Point in time when the stream currently ends; Unix timestamp in milliseconds
    }
  deriving (Eq)

instance Show GroupCallStream where
  show GroupCallStream
    { channel_id  = channel_id_
    , scale       = scale_
    , time_offset = time_offset_
    }
      = "GroupCallStream"
        ++ I.cc
        [ "channel_id"  `I.p` channel_id_
        , "scale"       `I.p` scale_
        , "time_offset" `I.p` time_offset_
        ]

instance AT.FromJSON GroupCallStream where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallStream" -> parseGroupCallStream v
      _                 -> mempty
    
    where
      parseGroupCallStream :: A.Value -> AT.Parser GroupCallStream
      parseGroupCallStream = A.withObject "GroupCallStream" $ \o -> do
        channel_id_  <- o A..:?  "channel_id"
        scale_       <- o A..:?  "scale"
        time_offset_ <- o A..:?  "time_offset"
        pure $ GroupCallStream
          { channel_id  = channel_id_
          , scale       = scale_
          , time_offset = time_offset_
          }
  parseJSON _ = mempty

instance AT.ToJSON GroupCallStream where
  toJSON GroupCallStream
    { channel_id  = channel_id_
    , scale       = scale_
    , time_offset = time_offset_
    }
      = A.object
        [ "@type"       A..= AT.String "groupCallStream"
        , "channel_id"  A..= channel_id_
        , "scale"       A..= scale_
        , "time_offset" A..= time_offset_
        ]

defaultGroupCallStream :: GroupCallStream
defaultGroupCallStream =
  GroupCallStream
    { channel_id  = Nothing
    , scale       = Nothing
    , time_offset = Nothing
    }

