{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.Emojis as Emojis
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data StickerSet = -- | Represents a sticker set
  StickerSet
  { -- | A list of emoji corresponding to the stickers in the same order. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
    emojis :: Maybe [Emojis.Emojis],
    -- | List of stickers in this set
    stickers :: Maybe [Sticker.Sticker],
    -- | True for already viewed trending sticker sets
    is_viewed :: Maybe Bool,
    -- | Type of the stickers in the set
    sticker_type :: Maybe StickerType.StickerType,
    -- | Format of the stickers in the set
    sticker_format :: Maybe StickerFormat.StickerFormat,
    -- | True, if the sticker set is official
    is_official :: Maybe Bool,
    -- | True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
    is_archived :: Maybe Bool,
    -- | True, if the sticker set has been installed by the current user
    is_installed :: Maybe Bool,
    -- | Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    thumbnail_outline :: Maybe [ClosedVectorPath.ClosedVectorPath],
    -- | Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Name of the sticker set
    name :: Maybe String,
    -- | Title of the sticker set
    title :: Maybe String,
    -- | Identifier of the sticker set
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show StickerSet where
  show
    StickerSet
      { emojis = emojis_,
        stickers = stickers_,
        is_viewed = is_viewed_,
        sticker_type = sticker_type_,
        sticker_format = sticker_format_,
        is_official = is_official_,
        is_archived = is_archived_,
        is_installed = is_installed_,
        thumbnail_outline = thumbnail_outline_,
        thumbnail = thumbnail_,
        name = name_,
        title = title_,
        _id = _id_
      } =
      "StickerSet"
        ++ U.cc
          [ U.p "emojis" emojis_,
            U.p "stickers" stickers_,
            U.p "is_viewed" is_viewed_,
            U.p "sticker_type" sticker_type_,
            U.p "sticker_format" sticker_format_,
            U.p "is_official" is_official_,
            U.p "is_archived" is_archived_,
            U.p "is_installed" is_installed_,
            U.p "thumbnail_outline" thumbnail_outline_,
            U.p "thumbnail" thumbnail_,
            U.p "name" name_,
            U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON StickerSet where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickerSet" -> parseStickerSet v
      _ -> mempty
    where
      parseStickerSet :: A.Value -> T.Parser StickerSet
      parseStickerSet = A.withObject "StickerSet" $ \o -> do
        emojis_ <- o A..:? "emojis"
        stickers_ <- o A..:? "stickers"
        is_viewed_ <- o A..:? "is_viewed"
        sticker_type_ <- o A..:? "sticker_type"
        sticker_format_ <- o A..:? "sticker_format"
        is_official_ <- o A..:? "is_official"
        is_archived_ <- o A..:? "is_archived"
        is_installed_ <- o A..:? "is_installed"
        thumbnail_outline_ <- o A..:? "thumbnail_outline"
        thumbnail_ <- o A..:? "thumbnail"
        name_ <- o A..:? "name"
        title_ <- o A..:? "title"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ StickerSet {emojis = emojis_, stickers = stickers_, is_viewed = is_viewed_, sticker_type = sticker_type_, sticker_format = sticker_format_, is_official = is_official_, is_archived = is_archived_, is_installed = is_installed_, thumbnail_outline = thumbnail_outline_, thumbnail = thumbnail_, name = name_, title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON StickerSet where
  toJSON
    StickerSet
      { emojis = emojis_,
        stickers = stickers_,
        is_viewed = is_viewed_,
        sticker_type = sticker_type_,
        sticker_format = sticker_format_,
        is_official = is_official_,
        is_archived = is_archived_,
        is_installed = is_installed_,
        thumbnail_outline = thumbnail_outline_,
        thumbnail = thumbnail_,
        name = name_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "stickerSet",
          "emojis" A..= emojis_,
          "stickers" A..= stickers_,
          "is_viewed" A..= is_viewed_,
          "sticker_type" A..= sticker_type_,
          "sticker_format" A..= sticker_format_,
          "is_official" A..= is_official_,
          "is_archived" A..= is_archived_,
          "is_installed" A..= is_installed_,
          "thumbnail_outline" A..= thumbnail_outline_,
          "thumbnail" A..= thumbnail_,
          "name" A..= name_,
          "title" A..= title_,
          "id" A..= U.toS _id_
        ]
