{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStickerSetTitle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets a sticker set title; for bots only @name Sticker set name @title New sticker set title
data SetStickerSetTitle = SetStickerSetTitle
  { -- |
    title :: Maybe String,
    -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show SetStickerSetTitle where
  show
    SetStickerSetTitle
      { title = title_,
        name = name_
      } =
      "SetStickerSetTitle"
        ++ U.cc
          [ U.p "title" title_,
            U.p "name" name_
          ]

instance T.ToJSON SetStickerSetTitle where
  toJSON
    SetStickerSetTitle
      { title = title_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "setStickerSetTitle",
          "title" A..= title_,
          "name" A..= name_
        ]
