{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDefaultChatPhotoCustomEmojiStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns default list of custom emoji stickers for placing on a chat photo
data GetDefaultChatPhotoCustomEmojiStickers = GetDefaultChatPhotoCustomEmojiStickers
  {
  }
  deriving (Eq)

instance Show GetDefaultChatPhotoCustomEmojiStickers where
  show GetDefaultChatPhotoCustomEmojiStickers =
    "GetDefaultChatPhotoCustomEmojiStickers"
      ++ U.cc
        []

instance T.ToJSON GetDefaultChatPhotoCustomEmojiStickers where
  toJSON GetDefaultChatPhotoCustomEmojiStickers =
    A.object
      [ "@type" A..= T.String "getDefaultChatPhotoCustomEmojiStickers"
      ]
