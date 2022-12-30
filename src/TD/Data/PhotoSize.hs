{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PhotoSize where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified Utils as U

-- |
data PhotoSize = -- | Describes an image in JPEG format
  PhotoSize
  { -- | Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image; in bytes
    progressive_sizes :: Maybe [Int],
    -- | Image height
    height :: Maybe Int,
    -- | Image width
    width :: Maybe Int,
    -- | Information about the image file
    photo :: Maybe File.File,
    -- | Image type (see https://core.telegram.org/constructor/photoSize)
    _type :: Maybe String
  }
  deriving (Eq)

instance Show PhotoSize where
  show
    PhotoSize
      { progressive_sizes = progressive_sizes_,
        height = height_,
        width = width_,
        photo = photo_,
        _type = _type_
      } =
      "PhotoSize"
        ++ U.cc
          [ U.p "progressive_sizes" progressive_sizes_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "photo" photo_,
            U.p "_type" _type_
          ]

instance T.FromJSON PhotoSize where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "photoSize" -> parsePhotoSize v
      _ -> mempty
    where
      parsePhotoSize :: A.Value -> T.Parser PhotoSize
      parsePhotoSize = A.withObject "PhotoSize" $ \o -> do
        progressive_sizes_ <- o A..:? "progressive_sizes"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        photo_ <- o A..:? "photo"
        _type_ <- o A..:? "type"
        return $ PhotoSize {progressive_sizes = progressive_sizes_, height = height_, width = width_, photo = photo_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON PhotoSize where
  toJSON
    PhotoSize
      { progressive_sizes = progressive_sizes_,
        height = height_,
        width = width_,
        photo = photo_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "photoSize",
          "progressive_sizes" A..= progressive_sizes_,
          "height" A..= height_,
          "width" A..= width_,
          "photo" A..= photo_,
          "type" A..= _type_
        ]
