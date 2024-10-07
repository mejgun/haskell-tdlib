module TD.Data.InputPaidMediaType
  (InputPaidMediaType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of paid media to sent
data InputPaidMediaType
  = InputPaidMediaTypePhoto -- ^ The media is a photo. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
  | InputPaidMediaTypeVideo -- ^ The media is a video
    { duration           :: Maybe Int  -- ^ Duration of the video, in seconds
    , supports_streaming :: Maybe Bool -- ^ True, if the video is expected to be streamed
    }
  deriving (Eq, Show)

instance I.ShortShow InputPaidMediaType where
  shortShow InputPaidMediaTypePhoto
      = "InputPaidMediaTypePhoto"
  shortShow InputPaidMediaTypeVideo
    { duration           = duration_
    , supports_streaming = supports_streaming_
    }
      = "InputPaidMediaTypeVideo"
        ++ I.cc
        [ "duration"           `I.p` duration_
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
        duration_           <- o A..:?  "duration"
        supports_streaming_ <- o A..:?  "supports_streaming"
        pure $ InputPaidMediaTypeVideo
          { duration           = duration_
          , supports_streaming = supports_streaming_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPaidMediaType where
  toJSON InputPaidMediaTypePhoto
      = A.object
        [ "@type" A..= AT.String "inputPaidMediaTypePhoto"
        ]
  toJSON InputPaidMediaTypeVideo
    { duration           = duration_
    , supports_streaming = supports_streaming_
    }
      = A.object
        [ "@type"              A..= AT.String "inputPaidMediaTypeVideo"
        , "duration"           A..= duration_
        , "supports_streaming" A..= supports_streaming_
        ]

