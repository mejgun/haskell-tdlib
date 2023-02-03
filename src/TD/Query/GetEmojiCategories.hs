{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetEmojiCategories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmojiCategoryType as EmojiCategoryType
import qualified Utils as U

-- |
-- Returns available emojis categories @type Type of emoji categories to return; pass null to get default emoji categories
data GetEmojiCategories = GetEmojiCategories
  { -- |
    _type :: Maybe EmojiCategoryType.EmojiCategoryType
  }
  deriving (Eq)

instance Show GetEmojiCategories where
  show
    GetEmojiCategories
      { _type = _type_
      } =
      "GetEmojiCategories"
        ++ U.cc
          [ U.p "_type" _type_
          ]

instance T.ToJSON GetEmojiCategories where
  toJSON
    GetEmojiCategories
      { _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "getEmojiCategories",
          "type" A..= _type_
        ]
