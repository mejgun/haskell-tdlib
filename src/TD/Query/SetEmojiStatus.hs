{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetEmojiStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmojiStatus as EmojiStatus
import qualified Utils as U

-- |
-- Changes the emoji status of the current user; for Telegram Premium users only @emoji_status New emoji status; pass null to switch to the default badge
data SetEmojiStatus = SetEmojiStatus
  { -- |
    emoji_status :: Maybe EmojiStatus.EmojiStatus
  }
  deriving (Eq)

instance Show SetEmojiStatus where
  show
    SetEmojiStatus
      { emoji_status = emoji_status_
      } =
      "SetEmojiStatus"
        ++ U.cc
          [ U.p "emoji_status" emoji_status_
          ]

instance T.ToJSON SetEmojiStatus where
  toJSON
    SetEmojiStatus
      { emoji_status = emoji_status_
      } =
      A.object
        [ "@type" A..= T.String "setEmojiStatus",
          "emoji_status" A..= emoji_status_
        ]
