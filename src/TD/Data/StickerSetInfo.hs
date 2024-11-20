module TD.Data.StickerSetInfo
  (StickerSetInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.Outline as Outline
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Sticker as Sticker

data StickerSetInfo
  = StickerSetInfo -- ^ Represents short information about a sticker set
    { _id                             :: Maybe Int                     -- ^ Identifier of the sticker set
    , title                           :: Maybe T.Text                  -- ^ Title of the sticker set
    , name                            :: Maybe T.Text                  -- ^ Name of the sticker set
    , thumbnail                       :: Maybe Thumbnail.Thumbnail     -- ^ Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
    , thumbnail_outline               :: Maybe Outline.Outline         -- ^ Sticker set thumbnail's outline; may be null if unknown
    , is_owned                        :: Maybe Bool                    -- ^ True, if the sticker set is owned by the current user
    , is_installed                    :: Maybe Bool                    -- ^ True, if the sticker set has been installed by the current user
    , is_archived                     :: Maybe Bool                    -- ^ True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
    , is_official                     :: Maybe Bool                    -- ^ True, if the sticker set is official
    , sticker_type                    :: Maybe StickerType.StickerType -- ^ Type of the stickers in the set
    , needs_repainting                :: Maybe Bool                    -- ^ True, if stickers in the sticker set are custom emoji that must be repainted; for custom emoji sticker sets only
    , is_allowed_as_chat_emoji_status :: Maybe Bool                    -- ^ True, if stickers in the sticker set are custom emoji that can be used as chat emoji status; for custom emoji sticker sets only
    , is_viewed                       :: Maybe Bool                    -- ^ True for already viewed trending sticker sets
    , size                            :: Maybe Int                     -- ^ Total number of stickers in the set
    , covers                          :: Maybe [Sticker.Sticker]       -- ^ Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
    }
  deriving (Eq, Show)

instance I.ShortShow StickerSetInfo where
  shortShow StickerSetInfo
    { _id                             = _id_
    , title                           = title_
    , name                            = name_
    , thumbnail                       = thumbnail_
    , thumbnail_outline               = thumbnail_outline_
    , is_owned                        = is_owned_
    , is_installed                    = is_installed_
    , is_archived                     = is_archived_
    , is_official                     = is_official_
    , sticker_type                    = sticker_type_
    , needs_repainting                = needs_repainting_
    , is_allowed_as_chat_emoji_status = is_allowed_as_chat_emoji_status_
    , is_viewed                       = is_viewed_
    , size                            = size_
    , covers                          = covers_
    }
      = "StickerSetInfo"
        ++ I.cc
        [ "_id"                             `I.p` _id_
        , "title"                           `I.p` title_
        , "name"                            `I.p` name_
        , "thumbnail"                       `I.p` thumbnail_
        , "thumbnail_outline"               `I.p` thumbnail_outline_
        , "is_owned"                        `I.p` is_owned_
        , "is_installed"                    `I.p` is_installed_
        , "is_archived"                     `I.p` is_archived_
        , "is_official"                     `I.p` is_official_
        , "sticker_type"                    `I.p` sticker_type_
        , "needs_repainting"                `I.p` needs_repainting_
        , "is_allowed_as_chat_emoji_status" `I.p` is_allowed_as_chat_emoji_status_
        , "is_viewed"                       `I.p` is_viewed_
        , "size"                            `I.p` size_
        , "covers"                          `I.p` covers_
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
        _id_                             <- fmap I.readInt64 <$> o A..:?  "id"
        title_                           <- o A..:?                       "title"
        name_                            <- o A..:?                       "name"
        thumbnail_                       <- o A..:?                       "thumbnail"
        thumbnail_outline_               <- o A..:?                       "thumbnail_outline"
        is_owned_                        <- o A..:?                       "is_owned"
        is_installed_                    <- o A..:?                       "is_installed"
        is_archived_                     <- o A..:?                       "is_archived"
        is_official_                     <- o A..:?                       "is_official"
        sticker_type_                    <- o A..:?                       "sticker_type"
        needs_repainting_                <- o A..:?                       "needs_repainting"
        is_allowed_as_chat_emoji_status_ <- o A..:?                       "is_allowed_as_chat_emoji_status"
        is_viewed_                       <- o A..:?                       "is_viewed"
        size_                            <- o A..:?                       "size"
        covers_                          <- o A..:?                       "covers"
        pure $ StickerSetInfo
          { _id                             = _id_
          , title                           = title_
          , name                            = name_
          , thumbnail                       = thumbnail_
          , thumbnail_outline               = thumbnail_outline_
          , is_owned                        = is_owned_
          , is_installed                    = is_installed_
          , is_archived                     = is_archived_
          , is_official                     = is_official_
          , sticker_type                    = sticker_type_
          , needs_repainting                = needs_repainting_
          , is_allowed_as_chat_emoji_status = is_allowed_as_chat_emoji_status_
          , is_viewed                       = is_viewed_
          , size                            = size_
          , covers                          = covers_
          }
  parseJSON _ = mempty

