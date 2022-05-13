{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSuggestedStickerSetName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a suggested name for a new sticker set with a given title @title Sticker set title; 1-64 characters
data GetSuggestedStickerSetName = GetSuggestedStickerSetName
  { -- |
    title :: Maybe String
  }
  deriving (Eq)

instance Show GetSuggestedStickerSetName where
  show
    GetSuggestedStickerSetName
      { title = title_
      } =
      "GetSuggestedStickerSetName"
        ++ U.cc
          [ U.p "title" title_
          ]

instance T.ToJSON GetSuggestedStickerSetName where
  toJSON
    GetSuggestedStickerSetName
      { title = title_
      } =
      A.object
        [ "@type" A..= T.String "getSuggestedStickerSetName",
          "title" A..= title_
        ]
