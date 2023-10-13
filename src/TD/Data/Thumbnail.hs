module TD.Data.Thumbnail
  ( Thumbnail(..)    
  , defaultThumbnail 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ThumbnailFormat as ThumbnailFormat
import qualified TD.Data.File as File

data Thumbnail
  = Thumbnail -- ^ Represents a thumbnail
    { format :: Maybe ThumbnailFormat.ThumbnailFormat -- ^ Thumbnail format
    , width  :: Maybe Int                             -- ^ Thumbnail width
    , height :: Maybe Int                             -- ^ Thumbnail height
    , file   :: Maybe File.File                       -- ^ The thumbnail
    }
  deriving (Eq)

instance Show Thumbnail where
  show Thumbnail
    { format = format_
    , width  = width_
    , height = height_
    , file   = file_
    }
      = "Thumbnail"
        ++ I.cc
        [ "format" `I.p` format_
        , "width"  `I.p` width_
        , "height" `I.p` height_
        , "file"   `I.p` file_
        ]

instance AT.FromJSON Thumbnail where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "thumbnail" -> parseThumbnail v
      _           -> mempty
    
    where
      parseThumbnail :: A.Value -> AT.Parser Thumbnail
      parseThumbnail = A.withObject "Thumbnail" $ \o -> do
        format_ <- o A..:?  "format"
        width_  <- o A..:?  "width"
        height_ <- o A..:?  "height"
        file_   <- o A..:?  "file"
        pure $ Thumbnail
          { format = format_
          , width  = width_
          , height = height_
          , file   = file_
          }
  parseJSON _ = mempty

instance AT.ToJSON Thumbnail where
  toJSON Thumbnail
    { format = format_
    , width  = width_
    , height = height_
    , file   = file_
    }
      = A.object
        [ "@type"  A..= AT.String "thumbnail"
        , "format" A..= format_
        , "width"  A..= width_
        , "height" A..= height_
        , "file"   A..= file_
        ]

defaultThumbnail :: Thumbnail
defaultThumbnail =
  Thumbnail
    { format = Nothing
    , width  = Nothing
    , height = Nothing
    , file   = Nothing
    }

