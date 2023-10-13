module TD.Query.SetSupergroupStickerSet(SetSupergroupStickerSet(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data SetSupergroupStickerSet -- ^ Changes the sticker set of a supergroup; requires can_change_info administrator right
  = SetSupergroupStickerSet
    { supergroup_id  :: Maybe Int -- ^ Identifier of the supergroup
    , sticker_set_id :: Maybe Int -- ^ New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
    }
  deriving (Eq)

instance Show SetSupergroupStickerSet where
  show
    SetSupergroupStickerSet
      { supergroup_id  = supergroup_id_
      , sticker_set_id = sticker_set_id_
      }
        = "SetSupergroupStickerSet"
          ++ I.cc
          [ "supergroup_id"  `I.p` supergroup_id_
          , "sticker_set_id" `I.p` sticker_set_id_
          ]

instance AT.ToJSON SetSupergroupStickerSet where
  toJSON
    SetSupergroupStickerSet
      { supergroup_id  = supergroup_id_
      , sticker_set_id = sticker_set_id_
      }
        = A.object
          [ "@type"          A..= AT.String "setSupergroupStickerSet"
          , "supergroup_id"  A..= supergroup_id_
          , "sticker_set_id" A..= fmap I.writeInt64  sticker_set_id_
          ]
