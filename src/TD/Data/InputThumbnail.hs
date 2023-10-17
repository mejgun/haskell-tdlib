module TD.Data.InputThumbnail
  ( InputThumbnail(..)    
  , defaultInputThumbnail 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data InputThumbnail
  = InputThumbnail -- ^ A thumbnail to be sent along with a file; must be in JPEG or WEBP format for stickers, and less than 200 KB in size
    { thumbnail :: Maybe InputFile.InputFile -- ^ Thumbnail file to send. Sending thumbnails by file_id is currently not supported
    , width     :: Maybe Int                 -- ^ Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
    , height    :: Maybe Int                 -- ^ Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow InputThumbnail where
  shortShow InputThumbnail
    { thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    }
      = "InputThumbnail"
        ++ I.cc
        [ "thumbnail" `I.p` thumbnail_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        ]

instance AT.FromJSON InputThumbnail where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputThumbnail" -> parseInputThumbnail v
      _                -> mempty
    
    where
      parseInputThumbnail :: A.Value -> AT.Parser InputThumbnail
      parseInputThumbnail = A.withObject "InputThumbnail" $ \o -> do
        thumbnail_ <- o A..:?  "thumbnail"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        pure $ InputThumbnail
          { thumbnail = thumbnail_
          , width     = width_
          , height    = height_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputThumbnail where
  toJSON InputThumbnail
    { thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    }
      = A.object
        [ "@type"     A..= AT.String "inputThumbnail"
        , "thumbnail" A..= thumbnail_
        , "width"     A..= width_
        , "height"    A..= height_
        ]

defaultInputThumbnail :: InputThumbnail
defaultInputThumbnail =
  InputThumbnail
    { thumbnail = Nothing
    , width     = Nothing
    , height    = Nothing
    }

