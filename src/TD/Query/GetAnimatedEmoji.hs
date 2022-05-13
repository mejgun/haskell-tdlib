{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetAnimatedEmoji where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji @emoji The emoji
data GetAnimatedEmoji = GetAnimatedEmoji
  { -- |
    emoji :: Maybe String
  }
  deriving (Eq)

instance Show GetAnimatedEmoji where
  show
    GetAnimatedEmoji
      { emoji = emoji_
      } =
      "GetAnimatedEmoji"
        ++ U.cc
          [ U.p "emoji" emoji_
          ]

instance T.ToJSON GetAnimatedEmoji where
  toJSON
    GetAnimatedEmoji
      { emoji = emoji_
      } =
      A.object
        [ "@type" A..= T.String "getAnimatedEmoji",
          "emoji" A..= emoji_
        ]
