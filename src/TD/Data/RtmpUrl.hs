module TD.Data.RtmpUrl
  ( RtmpUrl(..)    
  , defaultRtmpUrl 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data RtmpUrl
  = RtmpUrl -- ^ Represents an RTMP URL
    { url        :: Maybe T.Text -- ^ The URL
    , stream_key :: Maybe T.Text -- ^ Stream key
    }
  deriving (Eq)

instance Show RtmpUrl where
  show RtmpUrl
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

instance AT.ToJSON RtmpUrl where
  toJSON RtmpUrl
    { url        = url_
    , stream_key = stream_key_
    }
      = A.object
        [ "@type"      A..= AT.String "rtmpUrl"
        , "url"        A..= url_
        , "stream_key" A..= stream_key_
        ]

defaultRtmpUrl :: RtmpUrl
defaultRtmpUrl =
  RtmpUrl
    { url        = Nothing
    , stream_key = Nothing
    }

