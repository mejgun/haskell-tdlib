{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetEmojiStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmojiStatus as EmojiStatus
import qualified Utils as U

-- |
-- Changes the emoji status of the current user; for Telegram Premium users only
data SetEmojiStatus = SetEmojiStatus
  { -- | Duration of the status, in seconds; pass 0 to keep the status active until it will be changed manually
    duration :: Maybe Int,
    -- | New emoji status; pass null to switch to the default badge
    emoji_status :: Maybe EmojiStatus.EmojiStatus
  }
  deriving (Eq)

instance Show SetEmojiStatus where
  show
    SetEmojiStatus
      { duration = duration_,
        emoji_status = emoji_status_
      } =
      "SetEmojiStatus"
        ++ U.cc
          [ U.p "duration" duration_,
            U.p "emoji_status" emoji_status_
          ]

instance T.ToJSON SetEmojiStatus where
  toJSON
    SetEmojiStatus
      { duration = duration_,
        emoji_status = emoji_status_
      } =
      A.object
        [ "@type" A..= T.String "setEmojiStatus",
          "duration" A..= duration_,
          "emoji_status" A..= emoji_status_
        ]
