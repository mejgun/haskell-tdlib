{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ChangeStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Installs/uninstalls or activates/archives a sticker set @set_id Identifier of the sticker set @is_installed The new value of is_installed @is_archived The new value of is_archived. A sticker set can't be installed and archived simultaneously
data ChangeStickerSet = ChangeStickerSet
  { -- |
    is_archived :: Maybe Bool,
    -- |
    is_installed :: Maybe Bool,
    -- |
    set_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChangeStickerSet where
  show
    ChangeStickerSet
      { is_archived = is_archived_,
        is_installed = is_installed_,
        set_id = set_id_
      } =
      "ChangeStickerSet"
        ++ U.cc
          [ U.p "is_archived" is_archived_,
            U.p "is_installed" is_installed_,
            U.p "set_id" set_id_
          ]

instance T.ToJSON ChangeStickerSet where
  toJSON
    ChangeStickerSet
      { is_archived = is_archived_,
        is_installed = is_installed_,
        set_id = set_id_
      } =
      A.object
        [ "@type" A..= T.String "changeStickerSet",
          "is_archived" A..= is_archived_,
          "is_installed" A..= is_installed_,
          "set_id" A..= set_id_
        ]
