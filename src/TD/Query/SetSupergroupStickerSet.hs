module TD.Query.SetSupergroupStickerSet
  (SetSupergroupStickerSet(..)
  , defaultSetSupergroupStickerSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the sticker set of a supergroup; requires can_change_info administrator right. Returns 'TD.Data.Ok.Ok'
data SetSupergroupStickerSet
  = SetSupergroupStickerSet
    { supergroup_id  :: Maybe Int -- ^ Identifier of the supergroup
    , sticker_set_id :: Maybe Int -- ^ New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
    }
  deriving (Eq, Show)

instance I.ShortShow SetSupergroupStickerSet where
  shortShow
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

defaultSetSupergroupStickerSet :: SetSupergroupStickerSet
defaultSetSupergroupStickerSet =
  SetSupergroupStickerSet
    { supergroup_id  = Nothing
    , sticker_set_id = Nothing
    }

