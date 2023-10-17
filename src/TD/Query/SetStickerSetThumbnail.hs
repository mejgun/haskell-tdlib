module TD.Query.SetStickerSetThumbnail
  (SetStickerSetThumbnail(..)
  , defaultSetStickerSetThumbnail
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputFile as InputFile

-- | Sets a sticker set thumbnail; for bots only
data SetStickerSetThumbnail
  = SetStickerSetThumbnail
    { user_id   :: Maybe Int                 -- ^ Sticker set owner
    , name      :: Maybe T.Text              -- ^ Sticker set name
    , thumbnail :: Maybe InputFile.InputFile -- ^ Thumbnail to set in PNG, TGS, or WEBM format; pass null to remove the sticker set thumbnail. Thumbnail format must match the format of stickers in the set
    }
  deriving (Eq, Show)

instance I.ShortShow SetStickerSetThumbnail where
  shortShow
    SetStickerSetThumbnail
      { user_id   = user_id_
      , name      = name_
      , thumbnail = thumbnail_
      }
        = "SetStickerSetThumbnail"
          ++ I.cc
          [ "user_id"   `I.p` user_id_
          , "name"      `I.p` name_
          , "thumbnail" `I.p` thumbnail_
          ]

instance AT.ToJSON SetStickerSetThumbnail where
  toJSON
    SetStickerSetThumbnail
      { user_id   = user_id_
      , name      = name_
      , thumbnail = thumbnail_
      }
        = A.object
          [ "@type"     A..= AT.String "setStickerSetThumbnail"
          , "user_id"   A..= user_id_
          , "name"      A..= name_
          , "thumbnail" A..= thumbnail_
          ]

defaultSetStickerSetThumbnail :: SetStickerSetThumbnail
defaultSetStickerSetThumbnail =
  SetStickerSetThumbnail
    { user_id   = Nothing
    , name      = Nothing
    , thumbnail = Nothing
    }

