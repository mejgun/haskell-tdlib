module TD.Query.AddStickerToSet(AddStickerToSet(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputSticker as InputSticker

data AddStickerToSet -- ^ Adds a new sticker to a set; for bots only
  = AddStickerToSet
    { user_id :: Maybe Int                       -- ^ Sticker set owner
    , name    :: Maybe T.Text                    -- ^ Sticker set name
    , sticker :: Maybe InputSticker.InputSticker -- ^ Sticker to add to the set
    }
  deriving (Eq)

instance Show AddStickerToSet where
  show
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
