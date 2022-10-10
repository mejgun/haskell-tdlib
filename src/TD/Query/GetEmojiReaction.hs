{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetEmojiReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a emoji reaction. Returns a 404 error if the reaction is not found @emoji Text representation of the reaction
data GetEmojiReaction = GetEmojiReaction
  { -- |
    emoji :: Maybe String
  }
  deriving (Eq)

instance Show GetEmojiReaction where
  show
    GetEmojiReaction
      { emoji = emoji_
      } =
      "GetEmojiReaction"
        ++ U.cc
          [ U.p "emoji" emoji_
          ]

instance T.ToJSON GetEmojiReaction where
  toJSON
    GetEmojiReaction
      { emoji = emoji_
      } =
      A.object
        [ "@type" A..= T.String "getEmojiReaction",
          "emoji" A..= emoji_
        ]
