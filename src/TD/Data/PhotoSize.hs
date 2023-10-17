module TD.Data.PhotoSize
  (PhotoSize(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.File as File

data PhotoSize
  = PhotoSize -- ^ Describes an image in JPEG format
    { _type             :: Maybe T.Text    -- ^ Image type (see https://core.telegram.org/constructor/photoSize)
    , photo             :: Maybe File.File -- ^ Information about the image file
    , width             :: Maybe Int       -- ^ Image width
    , height            :: Maybe Int       -- ^ Image height
    , progressive_sizes :: Maybe [Int]     -- ^ Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image; in bytes
    }
  deriving (Eq, Show)

instance I.ShortShow PhotoSize where
  shortShow PhotoSize
    { _type             = _type_
    , photo             = photo_
    , width             = width_
    , height            = height_
    , progressive_sizes = progressive_sizes_
    }
      = "PhotoSize"
        ++ I.cc
        [ "_type"             `I.p` _type_
        , "photo"             `I.p` photo_
        , "width"             `I.p` width_
        , "height"            `I.p` height_
        , "progressive_sizes" `I.p` progressive_sizes_
        ]

instance AT.FromJSON PhotoSize where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "photoSize" -> parsePhotoSize v
      _           -> mempty
    
    where
      parsePhotoSize :: A.Value -> AT.Parser PhotoSize
      parsePhotoSize = A.withObject "PhotoSize" $ \o -> do
        _type_             <- o A..:?  "type"
        photo_             <- o A..:?  "photo"
        width_             <- o A..:?  "width"
        height_            <- o A..:?  "height"
        progressive_sizes_ <- o A..:?  "progressive_sizes"
        pure $ PhotoSize
          { _type             = _type_
          , photo             = photo_
          , width             = width_
          , height            = height_
          , progressive_sizes = progressive_sizes_
          }
  parseJSON _ = mempty

