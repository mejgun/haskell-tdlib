module TD.Data.InputPaidMediaType
  (InputPaidMediaType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Describes type of paid media to sent
data InputPaidMediaType
  = InputPaidMediaTypePhoto -- ^ The media is a photo. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
  | InputPaidMediaTypeVideo -- ^ The media is a video
    { cover              :: Maybe InputFile.InputFile -- ^ Cover of the video; pass null to skip cover uploading
    , start_timestamp    :: Maybe Int                 -- ^ Timestamp from which the video playing must start, in seconds
    , duration           :: Maybe Int                 -- ^ Duration of the video, in seconds
    , supports_streaming :: Maybe Bool                -- ^ True, if the video is expected to be streamed
    }
  deriving (Eq, Show)

instance I.ShortShow InputPaidMediaType where
  shortShow InputPaidMediaTypePhoto
      = "InputPaidMediaTypePhoto"
  shortShow InputPaidMediaTypeVideo
    { cover              = cover_
    , start_timestamp    = start_timestamp_
    , duration           = duration_
    , supports_streaming = supports_streaming_
    }
      = "InputPaidMediaTypeVideo"
        ++ I.cc
        [ "cover"              `I.p` cover_
        , "start_timestamp"    `I.p` start_timestamp_
        , "duration"           `I.p` duration_
        , "supports_streaming" `I.p` supports_streaming_
        ]

instance AT.FromJSON InputPaidMediaType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPaidMediaTypePhoto" -> pure InputPaidMediaTypePhoto
      "inputPaidMediaTypeVideo" -> parseInputPaidMediaTypeVideo v
      _                         -> mempty
    
    where
      parseInputPaidMediaTypeVideo :: A.Value -> AT.Parser InputPaidMediaType
      parseInputPaidMediaTypeVideo = A.withObject "InputPaidMediaTypeVideo" $ \o -> do
        cover_              <- o A..:?  "cover"
        start_timestamp_    <- o A..:?  "start_timestamp"
        duration_           <- o A..:?  "duration"
        supports_streaming_ <- o A..:?  "supports_streaming"
        pure $ InputPaidMediaTypeVideo
          { cover              = cover_
          , start_timestamp    = start_timestamp_
          , duration           = duration_
          , supports_streaming = supports_streaming_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPaidMediaType where
  toJSON InputPaidMediaTypePhoto
      = A.object
        [ "@type" A..= AT.String "inputPaidMediaTypePhoto"
        ]
  toJSON InputPaidMediaTypeVideo
    { cover              = cover_
    , start_timestamp    = start_timestamp_
    , duration           = duration_
    , supports_streaming = supports_streaming_
    }
      = A.object
        [ "@type"              A..= AT.String "inputPaidMediaTypeVideo"
        , "cover"              A..= cover_
        , "start_timestamp"    A..= start_timestamp_
        , "duration"           A..= duration_
        , "supports_streaming" A..= supports_streaming_
        ]

