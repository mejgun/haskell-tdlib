module TD.Data.Sticker
  (Sticker(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerFullType as StickerFullType
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data Sticker
  = Sticker -- ^ Describes a sticker
    { _id       :: Maybe Int                             -- ^ Unique sticker identifier within the set; 0 if none
    , set_id    :: Maybe Int                             -- ^ Identifier of the sticker set to which the sticker belongs; 0 if none
    , width     :: Maybe Int                             -- ^ Sticker width; as defined by the sender
    , height    :: Maybe Int                             -- ^ Sticker height; as defined by the sender
    , emoji     :: Maybe T.Text                          -- ^ Emoji corresponding to the sticker
    , format    :: Maybe StickerFormat.StickerFormat     -- ^ Sticker format
    , full_type :: Maybe StickerFullType.StickerFullType -- ^ Sticker's full type
    , thumbnail :: Maybe Thumbnail.Thumbnail             -- ^ Sticker thumbnail in WEBP or JPEG format; may be null
    , sticker   :: Maybe File.File                       -- ^ File containing the sticker
    }
  deriving (Eq, Show)

instance I.ShortShow Sticker where
  shortShow Sticker
    { _id       = _id_
    , set_id    = set_id_
    , width     = width_
    , height    = height_
    , emoji     = emoji_
    , format    = format_
    , full_type = full_type_
    , thumbnail = thumbnail_
    , sticker   = sticker_
    }
      = "Sticker"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "set_id"    `I.p` set_id_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        , "emoji"     `I.p` emoji_
        , "format"    `I.p` format_
        , "full_type" `I.p` full_type_
        , "thumbnail" `I.p` thumbnail_
        , "sticker"   `I.p` sticker_
        ]

instance AT.FromJSON Sticker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sticker" -> parseSticker v
      _         -> mempty
    
    where
      parseSticker :: A.Value -> AT.Parser Sticker
      parseSticker = A.withObject "Sticker" $ \o -> do
        _id_       <- fmap I.readInt64 <$> o A..:?  "id"
        set_id_    <- fmap I.readInt64 <$> o A..:?  "set_id"
        width_     <- o A..:?                       "width"
        height_    <- o A..:?                       "height"
        emoji_     <- o A..:?                       "emoji"
        format_    <- o A..:?                       "format"
        full_type_ <- o A..:?                       "full_type"
        thumbnail_ <- o A..:?                       "thumbnail"
        sticker_   <- o A..:?                       "sticker"
        pure $ Sticker
          { _id       = _id_
          , set_id    = set_id_
          , width     = width_
          , height    = height_
          , emoji     = emoji_
          , format    = format_
          , full_type = full_type_
          , thumbnail = thumbnail_
          , sticker   = sticker_
          }
  parseJSON _ = mempty

