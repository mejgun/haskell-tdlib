module TD.Query.AddStickerToSet
  (AddStickerToSet(..)
  , defaultAddStickerToSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputSticker as InputSticker

-- | Adds a new sticker to a set. Returns 'TD.Data.Ok.Ok'
data AddStickerToSet
  = AddStickerToSet
    { user_id :: Maybe Int                       -- ^ Sticker set owner; ignored for regular users
    , name    :: Maybe T.Text                    -- ^ Sticker set name. The sticker set must be owned by the current user, and contain less than 200 stickers for custom emoji sticker sets and less than 120 otherwise
    , sticker :: Maybe InputSticker.InputSticker -- ^ Sticker to add to the set
    }
  deriving (Eq, Show)

instance I.ShortShow AddStickerToSet where
  shortShow
    AddStickerToSet
      { user_id = user_id_
      , name    = name_
      , sticker = sticker_
      }
        = "AddStickerToSet"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "name"    `I.p` name_
          , "sticker" `I.p` sticker_
          ]

instance AT.ToJSON AddStickerToSet where
  toJSON
    AddStickerToSet
      { user_id = user_id_
      , name    = name_
      , sticker = sticker_
      }
        = A.object
          [ "@type"   A..= AT.String "addStickerToSet"
          , "user_id" A..= user_id_
          , "name"    A..= name_
          , "sticker" A..= sticker_
          ]

defaultAddStickerToSet :: AddStickerToSet
defaultAddStickerToSet =
  AddStickerToSet
    { user_id = Nothing
    , name    = Nothing
    , sticker = Nothing
    }

