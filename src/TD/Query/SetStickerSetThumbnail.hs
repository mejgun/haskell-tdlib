module TD.Query.SetStickerSetThumbnail
  (SetStickerSetThumbnail(..)
  , defaultSetStickerSetThumbnail
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.StickerFormat as StickerFormat

-- | Sets a sticker set thumbnail. Returns 'TD.Data.Ok.Ok'
data SetStickerSetThumbnail
  = SetStickerSetThumbnail
    { user_id   :: Maybe Int                         -- ^ Sticker set owner; ignored for regular users
    , name      :: Maybe T.Text                      -- ^ Sticker set name. The sticker set must be owned by the current user
    , thumbnail :: Maybe InputFile.InputFile         -- ^ Thumbnail to set; pass null to remove the sticker set thumbnail
    , format    :: Maybe StickerFormat.StickerFormat -- ^ Format of the thumbnail; pass null if thumbnail is removed
    }
  deriving (Eq, Show)

instance I.ShortShow SetStickerSetThumbnail where
  shortShow
    SetStickerSetThumbnail
      { user_id   = user_id_
      , name      = name_
      , thumbnail = thumbnail_
      , format    = format_
      }
        = "SetStickerSetThumbnail"
          ++ I.cc
          [ "user_id"   `I.p` user_id_
          , "name"      `I.p` name_
          , "thumbnail" `I.p` thumbnail_
          , "format"    `I.p` format_
          ]

instance AT.ToJSON SetStickerSetThumbnail where
  toJSON
    SetStickerSetThumbnail
      { user_id   = user_id_
      , name      = name_
      , thumbnail = thumbnail_
      , format    = format_
      }
        = A.object
          [ "@type"     A..= AT.String "setStickerSetThumbnail"
          , "user_id"   A..= user_id_
          , "name"      A..= name_
          , "thumbnail" A..= thumbnail_
          , "format"    A..= format_
          ]

defaultSetStickerSetThumbnail :: SetStickerSetThumbnail
defaultSetStickerSetThumbnail =
  SetStickerSetThumbnail
    { user_id   = Nothing
    , name      = Nothing
    , thumbnail = Nothing
    , format    = Nothing
    }

