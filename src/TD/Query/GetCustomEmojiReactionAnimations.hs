{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCustomEmojiReactionAnimations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns TGS stickers with generic animations for custom emoji reactions
data GetCustomEmojiReactionAnimations = GetCustomEmojiReactionAnimations
  {
  }
  deriving (Eq)

instance Show GetCustomEmojiReactionAnimations where
  show GetCustomEmojiReactionAnimations =
    "GetCustomEmojiReactionAnimations"
      ++ U.cc
        []

instance T.ToJSON GetCustomEmojiReactionAnimations where
  toJSON GetCustomEmojiReactionAnimations =
    A.object
      [ "@type" A..= T.String "getCustomEmojiReactionAnimations"
      ]
