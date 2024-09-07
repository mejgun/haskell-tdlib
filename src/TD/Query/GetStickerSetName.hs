module TD.Query.GetStickerSetName
  (GetStickerSetName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns name of a sticker set by its identifier. Returns 'TD.Data.Text.Text'
data GetStickerSetName
  = GetStickerSetName
    { set_id :: Maybe Int -- ^ Identifier of the sticker set
    }
  deriving (Eq, Show)

instance I.ShortShow GetStickerSetName where
  shortShow
    GetStickerSetName
      { set_id = set_id_
      }
        = "GetStickerSetName"
          ++ I.cc
          [ "set_id" `I.p` set_id_
          ]

instance AT.ToJSON GetStickerSetName where
  toJSON
    GetStickerSetName
      { set_id = set_id_
      }
        = A.object
          [ "@type"  A..= AT.String "getStickerSetName"
          , "set_id" A..= fmap I.writeInt64  set_id_
          ]

