module TD.Data.AlternativeVideo
  (AlternativeVideo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.File as File

data AlternativeVideo
  = AlternativeVideo -- ^ Describes an alternative re-encoded quality of a video file
    { width    :: Maybe Int       -- ^ Video width
    , height   :: Maybe Int       -- ^ Video height
    , codec    :: Maybe T.Text    -- ^ Codec used for video file encoding, for example, "h264", "h265", or "av1"
    , hls_file :: Maybe File.File -- ^ HLS file describing the video
    , video    :: Maybe File.File -- ^ File containing the video
    }
  deriving (Eq, Show)

instance I.ShortShow AlternativeVideo where
  shortShow AlternativeVideo
    { width    = width_
    , height   = height_
    , codec    = codec_
    , hls_file = hls_file_
    , video    = video_
    }
      = "AlternativeVideo"
        ++ I.cc
        [ "width"    `I.p` width_
        , "height"   `I.p` height_
        , "codec"    `I.p` codec_
        , "hls_file" `I.p` hls_file_
        , "video"    `I.p` video_
        ]

instance AT.FromJSON AlternativeVideo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "alternativeVideo" -> parseAlternativeVideo v
      _                  -> mempty
    
    where
      parseAlternativeVideo :: A.Value -> AT.Parser AlternativeVideo
      parseAlternativeVideo = A.withObject "AlternativeVideo" $ \o -> do
        width_    <- o A..:?  "width"
        height_   <- o A..:?  "height"
        codec_    <- o A..:?  "codec"
        hls_file_ <- o A..:?  "hls_file"
        video_    <- o A..:?  "video"
        pure $ AlternativeVideo
          { width    = width_
          , height   = height_
          , codec    = codec_
          , hls_file = hls_file_
          , video    = video_
          }
  parseJSON _ = mempty

