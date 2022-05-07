{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatSlowModeDelay where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members rights @chat_id Chat identifier @slow_mode_delay New slow mode delay for the chat, in seconds; must be one of 0, 10, 30, 60, 300, 900, 3600
data SetChatSlowModeDelay = SetChatSlowModeDelay
  { -- |
    slow_mode_delay :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatSlowModeDelay where
  show
    SetChatSlowModeDelay
      { slow_mode_delay = slow_mode_delay,
        chat_id = chat_id
      } =
      "SetChatSlowModeDelay"
        ++ U.cc
          [ U.p "slow_mode_delay" slow_mode_delay,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatSlowModeDelay where
  toJSON
    SetChatSlowModeDelay
      { slow_mode_delay = slow_mode_delay,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatSlowModeDelay",
          "slow_mode_delay" A..= slow_mode_delay,
          "chat_id" A..= chat_id
        ]
