{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Photo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.PhotoSize as PhotoSize
import qualified Utils as U

data Photo = -- | Describes a photo @has_stickers True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
  Photo
  { -- |
    sizes :: Maybe [PhotoSize.PhotoSize],
    -- | Photo minithumbnail; may be null @sizes Available variants of the photo, in different sizes
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- |
    has_stickers :: Maybe Bool
  }
  deriving (Eq)

instance Show Photo where
  show
    Photo
      { sizes = sizes_,
        minithumbnail = minithumbnail_,
        has_stickers = has_stickers_
      } =
      "Photo"
        ++ U.cc
          [ U.p "sizes" sizes_,
            U.p "minithumbnail" minithumbnail_,
            U.p "has_stickers" has_stickers_
          ]

instance T.FromJSON Photo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "photo" -> parsePhoto v
      _ -> mempty
    where
      parsePhoto :: A.Value -> T.Parser Photo
      parsePhoto = A.withObject "Photo" $ \o -> do
        sizes_ <- o A..:? "sizes"
        minithumbnail_ <- o A..:? "minithumbnail"
        has_stickers_ <- o A..:? "has_stickers"
        return $ Photo {sizes = sizes_, minithumbnail = minithumbnail_, has_stickers = has_stickers_}
  parseJSON _ = mempty

instance T.ToJSON Photo where
  toJSON
    Photo
      { sizes = sizes_,
        minithumbnail = minithumbnail_,
        has_stickers = has_stickers_
      } =
      A.object
        [ "@type" A..= T.String "photo",
          "sizes" A..= sizes_,
          "minithumbnail" A..= minithumbnail_,
          "has_stickers" A..= has_stickers_
        ]
