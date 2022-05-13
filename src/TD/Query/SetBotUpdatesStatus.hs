{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotUpdatesStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only @pending_update_count The number of pending updates @error_message The last error message
data SetBotUpdatesStatus = SetBotUpdatesStatus
  { -- |
    error_message :: Maybe String,
    -- |
    pending_update_count :: Maybe Int
  }
  deriving (Eq)

instance Show SetBotUpdatesStatus where
  show
    SetBotUpdatesStatus
      { error_message = error_message_,
        pending_update_count = pending_update_count_
      } =
      "SetBotUpdatesStatus"
        ++ U.cc
          [ U.p "error_message" error_message_,
            U.p "pending_update_count" pending_update_count_
          ]

instance T.ToJSON SetBotUpdatesStatus where
  toJSON
    SetBotUpdatesStatus
      { error_message = error_message_,
        pending_update_count = pending_update_count_
      } =
      A.object
        [ "@type" A..= T.String "setBotUpdatesStatus",
          "error_message" A..= error_message_,
          "pending_update_count" A..= pending_update_count_
        ]
