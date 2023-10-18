module TD.Query.ChangeStickerSet
  (ChangeStickerSet(..)
  , defaultChangeStickerSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Installs/uninstalls or activates/archives a sticker set. Returns 'TD.Data.Ok.Ok'
data ChangeStickerSet
  = ChangeStickerSet
    { set_id       :: Maybe Int  -- ^ Identifier of the sticker set
    , is_installed :: Maybe Bool -- ^ The new value of is_installed
    , is_archived  :: Maybe Bool -- ^ The new value of is_archived. A sticker set can't be installed and archived simultaneously
    }
  deriving (Eq, Show)

instance I.ShortShow ChangeStickerSet where
  shortShow
    ChangeStickerSet
      { set_id       = set_id_
      , is_installed = is_installed_
      , is_archived  = is_archived_
      }
        = "ChangeStickerSet"
          ++ I.cc
          [ "set_id"       `I.p` set_id_
          , "is_installed" `I.p` is_installed_
          , "is_archived"  `I.p` is_archived_
          ]

instance AT.ToJSON ChangeStickerSet where
  toJSON
    ChangeStickerSet
      { set_id       = set_id_
      , is_installed = is_installed_
      , is_archived  = is_archived_
      }
        = A.object
          [ "@type"        A..= AT.String "changeStickerSet"
          , "set_id"       A..= fmap I.writeInt64  set_id_
          , "is_installed" A..= is_installed_
          , "is_archived"  A..= is_archived_
          ]

defaultChangeStickerSet :: ChangeStickerSet
defaultChangeStickerSet =
  ChangeStickerSet
    { set_id       = Nothing
    , is_installed = Nothing
    , is_archived  = Nothing
    }

