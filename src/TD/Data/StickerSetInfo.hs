module TD.Data.StickerSetInfo
  ( StickerSetInfo(..)    
  , defaultStickerSetInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Sticker as Sticker

data StickerSetInfo
  = StickerSetInfo -- ^ Represents short information about a sticker set
    { _id               :: Maybe Int                                 -- ^ Identifier of the sticker set
    , title             :: Maybe T.Text                              -- ^ Title of the sticker set
    , name              :: Maybe T.Text                              -- ^ Name of the sticker set
    , thumbnail         :: Maybe Thumbnail.Thumbnail                 -- ^ Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null
    , thumbnail_outline :: Maybe [ClosedVectorPath.ClosedVectorPath] -- ^ Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    , is_installed      :: Maybe Bool                                -- ^ True, if the sticker set has been installed by the current user
    , is_archived       :: Maybe Bool                                -- ^ True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
    , is_official       :: Maybe Bool                                -- ^ True, if the sticker set is official
    , sticker_format    :: Maybe StickerFormat.StickerFormat         -- ^ Format of the stickers in the set
    , sticker_type      :: Maybe StickerType.StickerType             -- ^ Type of the stickers in the set
    , is_viewed         :: Maybe Bool                                -- ^ True for already viewed trending sticker sets
    , size              :: Maybe Int                                 -- ^ Total number of stickers in the set
    , covers            :: Maybe [Sticker.Sticker]                   -- ^ Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
    }
  deriving (Eq)

instance Show StickerSetInfo where
  show StickerSetInfo
    { _id               = _id_
    , title             = title_
    , name              = name_
    , thumbnail         = thumbnail_
    , thumbnail_outline = thumbnail_outline_
    , is_installed      = is_installed_
    , is_archived       = is_archived_
    , is_official       = is_official_
    , sticker_format    = sticker_format_
    , sticker_type      = sticker_type_
    , is_viewed         = is_viewed_
    , size              = size_
    , covers            = covers_
    }
      = "StickerSetInfo"
        ++ I.cc
        [ "_id"               `I.p` _id_
        , "title"             `I.p` title_
        , "name"              `I.p` name_
        , "thumbnail"         `I.p` thumbnail_
        , "thumbnail_outline" `I.p` thumbnail_outline_
        , "is_installed"      `I.p` is_installed_
        , "is_archived"       `I.p` is_archived_
        , "is_official"       `I.p` is_official_
        , "sticker_format"    `I.p` sticker_format_
        , "sticker_type"      `I.p` sticker_type_
        , "is_viewed"         `I.p` is_viewed_
        , "size"              `I.p` size_
        , "covers"            `I.p` covers_
        ]

instance AT.FromJSON StickerSetInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickerSetInfo" -> parseStickerSetInfo v
      _                -> mempty
    
    where
      parseStickerSetInfo :: A.Value -> AT.Parser StickerSetInfo
      parseStickerSetInfo = A.withObject "StickerSetInfo" $ \o -> do
        _id_               <- fmap I.readInt64 <$> o A..:?  "id"
        title_             <- o A..:?                       "title"
        name_              <- o A..:?                       "name"
        thumbnail_         <- o A..:?                       "thumbnail"
        thumbnail_outline_ <- o A..:?                       "thumbnail_outline"
        is_installed_      <- o A..:?                       "is_installed"
        is_archived_       <- o A..:?                       "is_archived"
        is_official_       <- o A..:?                       "is_official"
        sticker_format_    <- o A..:?                       "sticker_format"
        sticker_type_      <- o A..:?                       "sticker_type"
        is_viewed_         <- o A..:?                       "is_viewed"
        size_              <- o A..:?                       "size"
        covers_            <- o A..:?                       "covers"
        pure $ StickerSetInfo
          { _id               = _id_
          , title             = title_
          , name              = name_
          , thumbnail         = thumbnail_
          , thumbnail_outline = thumbnail_outline_
          , is_installed      = is_installed_
          , is_archived       = is_archived_
          , is_official       = is_official_
          , sticker_format    = sticker_format_
          , sticker_type      = sticker_type_
          , is_viewed         = is_viewed_
          , size              = size_
          , covers            = covers_
          }
  parseJSON _ = mempty

instance AT.ToJSON StickerSetInfo where
  toJSON StickerSetInfo
    { _id               = _id_
    , title             = title_
    , name              = name_
    , thumbnail         = thumbnail_
    , thumbnail_outline = thumbnail_outline_
    , is_installed      = is_installed_
    , is_archived       = is_archived_
    , is_official       = is_official_
    , sticker_format    = sticker_format_
    , sticker_type      = sticker_type_
    , is_viewed         = is_viewed_
    , size              = size_
    , covers            = covers_
    }
      = A.object
        [ "@type"             A..= AT.String "stickerSetInfo"
        , "id"                A..= fmap I.writeInt64  _id_
        , "title"             A..= title_
        , "name"              A..= name_
        , "thumbnail"         A..= thumbnail_
        , "thumbnail_outline" A..= thumbnail_outline_
        , "is_installed"      A..= is_installed_
        , "is_archived"       A..= is_archived_
        , "is_official"       A..= is_official_
        , "sticker_format"    A..= sticker_format_
        , "sticker_type"      A..= sticker_type_
        , "is_viewed"         A..= is_viewed_
        , "size"              A..= size_
        , "covers"            A..= covers_
        ]

defaultStickerSetInfo :: StickerSetInfo
defaultStickerSetInfo =
  StickerSetInfo
    { _id               = Nothing
    , title             = Nothing
    , name              = Nothing
    , thumbnail         = Nothing
    , thumbnail_outline = Nothing
    , is_installed      = Nothing
    , is_archived       = Nothing
    , is_official       = Nothing
    , sticker_format    = Nothing
    , sticker_type      = Nothing
    , is_viewed         = Nothing
    , size              = Nothing
    , covers            = Nothing
    }

