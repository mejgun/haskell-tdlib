module TD.Query.ReplaceStickerInSet
  (ReplaceStickerInSet(..)
  , defaultReplaceStickerInSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputSticker as InputSticker

-- | Replaces existing sticker in a set. The function is equivalent to removeStickerFromSet, then addStickerToSet, then setStickerPositionInSet. Returns 'TD.Data.Ok.Ok'
data ReplaceStickerInSet
  = ReplaceStickerInSet
    { user_id     :: Maybe Int                       -- ^ Sticker set owner; ignored for regular users
    , name        :: Maybe T.Text                    -- ^ Sticker set name. The sticker set must be owned by the current user
    , old_sticker :: Maybe InputFile.InputFile       -- ^ Sticker to remove from the set
    , new_sticker :: Maybe InputSticker.InputSticker -- ^ Sticker to add to the set
    }
  deriving (Eq, Show)

instance I.ShortShow ReplaceStickerInSet where
  shortShow
    ReplaceStickerInSet
      { user_id     = user_id_
      , name        = name_
      , old_sticker = old_sticker_
      , new_sticker = new_sticker_
      }
        = "ReplaceStickerInSet"
          ++ I.cc
          [ "user_id"     `I.p` user_id_
          , "name"        `I.p` name_
          , "old_sticker" `I.p` old_sticker_
          , "new_sticker" `I.p` new_sticker_
          ]

instance AT.ToJSON ReplaceStickerInSet where
  toJSON
    ReplaceStickerInSet
      { user_id     = user_id_
      , name        = name_
      , old_sticker = old_sticker_
      , new_sticker = new_sticker_
      }
        = A.object
          [ "@type"       A..= AT.String "replaceStickerInSet"
          , "user_id"     A..= user_id_
          , "name"        A..= name_
          , "old_sticker" A..= old_sticker_
          , "new_sticker" A..= new_sticker_
          ]

defaultReplaceStickerInSet :: ReplaceStickerInSet
defaultReplaceStickerInSet =
  ReplaceStickerInSet
    { user_id     = Nothing
    , name        = Nothing
    , old_sticker = Nothing
    , new_sticker = Nothing
    }

