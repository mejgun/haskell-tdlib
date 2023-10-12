module TD.Data.Sticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerFullType as StickerFullType
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data Sticker
  = Sticker -- ^ Describes a sticker
    { _id       :: Maybe Int                                 -- ^ Unique sticker identifier within the set; 0 if none
    , set_id    :: Maybe Int                                 -- ^ Identifier of the sticker set to which the sticker belongs; 0 if none
    , width     :: Maybe Int                                 -- ^ Sticker width; as defined by the sender
    , height    :: Maybe Int                                 -- ^ Sticker height; as defined by the sender
    , emoji     :: Maybe T.Text                              -- ^ Emoji corresponding to the sticker
    , format    :: Maybe StickerFormat.StickerFormat         -- ^ Sticker format
    , full_type :: Maybe StickerFullType.StickerFullType     -- ^ Sticker's full type
    , outline   :: Maybe [ClosedVectorPath.ClosedVectorPath] -- ^ Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    , thumbnail :: Maybe Thumbnail.Thumbnail                 -- ^ Sticker thumbnail in WEBP or JPEG format; may be null
    , sticker   :: Maybe File.File                           -- ^ File containing the sticker
    }
  deriving (Eq)

instance Show Sticker where
  show Sticker
    { _id       = _id_
    , set_id    = set_id_
    , width     = width_
    , height    = height_
    , emoji     = emoji_
    , format    = format_
    , full_type = full_type_
    , outline   = outline_
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
        , "outline"   `I.p` outline_
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
        outline_   <- o A..:?                       "outline"
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
          , outline   = outline_
          , thumbnail = thumbnail_
          , sticker   = sticker_
          }

instance AT.ToJSON Sticker where
  toJSON Sticker
    { _id       = _id_
    , set_id    = set_id_
    , width     = width_
    , height    = height_
    , emoji     = emoji_
    , format    = format_
    , full_type = full_type_
    , outline   = outline_
    , thumbnail = thumbnail_
    , sticker   = sticker_
    }
      = A.object
        [ "@type"     A..= AT.String "sticker"
        , "id"        A..= fmap I.writeInt64  _id_
        , "set_id"    A..= fmap I.writeInt64  set_id_
        , "width"     A..= width_
        , "height"    A..= height_
        , "emoji"     A..= emoji_
        , "format"    A..= format_
        , "full_type" A..= full_type_
        , "outline"   A..= outline_
        , "thumbnail" A..= thumbnail_
        , "sticker"   A..= sticker_
        ]
