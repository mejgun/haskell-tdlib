{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Photo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Minithumbnail as Minithumbnail
import qualified TD.Reply.PhotoSize as PhotoSize
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
      { sizes = sizes,
        minithumbnail = minithumbnail,
        has_stickers = has_stickers
      } =
      "Photo"
        ++ U.cc
          [ U.p "sizes" sizes,
            U.p "minithumbnail" minithumbnail,
            U.p "has_stickers" has_stickers
          ]

instance T.FromJSON Photo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "photo" -> parsePhoto v
      _ -> fail ""
    where
      parsePhoto :: A.Value -> T.Parser Photo
      parsePhoto = A.withObject "Photo" $ \o -> do
        sizes_ <- o A..:? "sizes"
        minithumbnail_ <- o A..:? "minithumbnail"
        has_stickers_ <- o A..:? "has_stickers"
        return $ Photo {sizes = sizes_, minithumbnail = minithumbnail_, has_stickers = has_stickers_}
  parseJSON _ = fail ""

instance T.ToJSON Photo where
  toJSON
    Photo
      { sizes = sizes,
        minithumbnail = minithumbnail,
        has_stickers = has_stickers
      } =
      A.object
        [ "@type" A..= T.String "photo",
          "sizes" A..= sizes,
          "minithumbnail" A..= minithumbnail,
          "has_stickers" A..= has_stickers
        ]
