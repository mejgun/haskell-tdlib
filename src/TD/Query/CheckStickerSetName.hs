{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckStickerSetName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether a name can be used for a new sticker set @name Name to be checked
data CheckStickerSetName = CheckStickerSetName
  { -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show CheckStickerSetName where
  show
    CheckStickerSetName
      { name = name_
      } =
      "CheckStickerSetName"
        ++ U.cc
          [ U.p "name" name_
          ]

instance T.ToJSON CheckStickerSetName where
  toJSON
    CheckStickerSetName
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "checkStickerSetName",
          "name" A..= name_
        ]
