module TD.Data.RtmpUrl
  (RtmpUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data RtmpUrl
  = RtmpUrl -- ^ Represents an RTMP URL
    { url        :: Maybe T.Text -- ^ The URL
    , stream_key :: Maybe T.Text -- ^ Stream key
    }
  deriving (Eq, Show)

instance I.ShortShow RtmpUrl where
  shortShow RtmpUrl
    { url        = url_
    , stream_key = stream_key_
    }
      = "RtmpUrl"
        ++ I.cc
        [ "url"        `I.p` url_
        , "stream_key" `I.p` stream_key_
        ]

instance AT.FromJSON RtmpUrl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "rtmpUrl" -> parseRtmpUrl v
      _         -> mempty
    
    where
      parseRtmpUrl :: A.Value -> AT.Parser RtmpUrl
      parseRtmpUrl = A.withObject "RtmpUrl" $ \o -> do
        url_        <- o A..:?  "url"
        stream_key_ <- o A..:?  "stream_key"
        pure $ RtmpUrl
          { url        = url_
          , stream_key = stream_key_
          }
  parseJSON _ = mempty

