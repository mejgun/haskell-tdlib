{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDefaultProfilePhotoCustomEmojiStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns default list of custom emoji stickers for placing on a profile photo
data GetDefaultProfilePhotoCustomEmojiStickers = GetDefaultProfilePhotoCustomEmojiStickers
  {
  }
  deriving (Eq)

instance Show GetDefaultProfilePhotoCustomEmojiStickers where
  show GetDefaultProfilePhotoCustomEmojiStickers =
    "GetDefaultProfilePhotoCustomEmojiStickers"
      ++ U.cc
        []

instance T.ToJSON GetDefaultProfilePhotoCustomEmojiStickers where
  toJSON GetDefaultProfilePhotoCustomEmojiStickers =
    A.object
      [ "@type" A..= T.String "getDefaultProfilePhotoCustomEmojiStickers"
      ]
