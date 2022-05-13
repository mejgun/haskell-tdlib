{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StickerSetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

data StickerSetInfo = -- | Represents short information about a sticker set
  StickerSetInfo
  { -- |
    covers :: Maybe [Sticker.Sticker],
    -- | Total number of stickers in the set @covers Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
    size :: Maybe Int,
    -- |
    is_viewed :: Maybe Bool,
    -- |
    sticker_type :: Maybe StickerType.StickerType,
    -- | True, if the sticker set is official @sticker_type Type of the stickers in the set @is_viewed True for already viewed trending sticker sets
    is_official :: Maybe Bool,
    -- |
    is_archived :: Maybe Bool,
    -- | True, if the sticker set has been installed by the current user @is_archived True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
    is_installed :: Maybe Bool,
    -- | Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    thumbnail_outline :: Maybe [ClosedVectorPath.ClosedVectorPath],
    -- |
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- |
    name :: Maybe String,
    -- |
    title :: Maybe String,
    -- | Identifier of the sticker set @title Title of the sticker set @name Name of the sticker set @thumbnail Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show StickerSetInfo where
  show
    StickerSetInfo
      { covers = covers_,
        size = size_,
        is_viewed = is_viewed_,
        sticker_type = sticker_type_,
        is_official = is_official_,
        is_archived = is_archived_,
        is_installed = is_installed_,
        thumbnail_outline = thumbnail_outline_,
        thumbnail = thumbnail_,
        name = name_,
        title = title_,
        _id = _id_
      } =
      "StickerSetInfo"
        ++ U.cc
          [ U.p "covers" covers_,
            U.p "size" size_,
            U.p "is_viewed" is_viewed_,
            U.p "sticker_type" sticker_type_,
            U.p "is_official" is_official_,
            U.p "is_archived" is_archived_,
            U.p "is_installed" is_installed_,
            U.p "thumbnail_outline" thumbnail_outline_,
            U.p "thumbnail" thumbnail_,
            U.p "name" name_,
            U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON StickerSetInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickerSetInfo" -> parseStickerSetInfo v
      _ -> mempty
    where
      parseStickerSetInfo :: A.Value -> T.Parser StickerSetInfo
      parseStickerSetInfo = A.withObject "StickerSetInfo" $ \o -> do
        covers_ <- o A..:? "covers"
        size_ <- mconcat [o A..:? "size", U.rm <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
        is_viewed_ <- o A..:? "is_viewed"
        sticker_type_ <- o A..:? "sticker_type"
        is_official_ <- o A..:? "is_official"
        is_archived_ <- o A..:? "is_archived"
        is_installed_ <- o A..:? "is_installed"
        thumbnail_outline_ <- o A..:? "thumbnail_outline"
        thumbnail_ <- o A..:? "thumbnail"
        name_ <- o A..:? "name"
        title_ <- o A..:? "title"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ StickerSetInfo {covers = covers_, size = size_, is_viewed = is_viewed_, sticker_type = sticker_type_, is_official = is_official_, is_archived = is_archived_, is_installed = is_installed_, thumbnail_outline = thumbnail_outline_, thumbnail = thumbnail_, name = name_, title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON StickerSetInfo where
  toJSON
    StickerSetInfo
      { covers = covers_,
        size = size_,
        is_viewed = is_viewed_,
        sticker_type = sticker_type_,
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
        [ "@type" A..= T.String "stickerSetInfo",
          "covers" A..= covers_,
          "size" A..= size_,
          "is_viewed" A..= is_viewed_,
          "sticker_type" A..= sticker_type_,
          "is_official" A..= is_official_,
          "is_archived" A..= is_archived_,
          "is_installed" A..= is_installed_,
          "thumbnail_outline" A..= thumbnail_outline_,
          "thumbnail" A..= thumbnail_,
          "name" A..= name_,
          "title" A..= title_,
          "id" A..= _id_
        ]
