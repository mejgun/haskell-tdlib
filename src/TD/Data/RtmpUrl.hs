{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RtmpUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data RtmpUrl = -- | Represents an RTMP URL @url The URL @stream_key Stream key
  RtmpUrl
  { -- |
    stream_key :: Maybe String,
    -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show RtmpUrl where
  show
    RtmpUrl
      { stream_key = stream_key_,
        url = url_
      } =
      "RtmpUrl"
        ++ U.cc
          [ U.p "stream_key" stream_key_,
            U.p "url" url_
          ]

instance T.FromJSON RtmpUrl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "rtmpUrl" -> parseRtmpUrl v
      _ -> mempty
    where
      parseRtmpUrl :: A.Value -> T.Parser RtmpUrl
      parseRtmpUrl = A.withObject "RtmpUrl" $ \o -> do
        stream_key_ <- o A..:? "stream_key"
        url_ <- o A..:? "url"
        return $ RtmpUrl {stream_key = stream_key_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON RtmpUrl where
  toJSON
    RtmpUrl
      { stream_key = stream_key_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "rtmpUrl",
          "stream_key" A..= stream_key_,
          "url" A..= url_
        ]
