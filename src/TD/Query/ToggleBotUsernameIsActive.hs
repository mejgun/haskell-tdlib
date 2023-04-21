{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleBotUsernameIsActive where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes active state for a username of a bot. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Can be called only if userTypeBot.can_be_edited == true
data ToggleBotUsernameIsActive = ToggleBotUsernameIsActive
  { -- | Pass true to activate the username; pass false to disable it
    is_active :: Maybe Bool,
    -- | The username to change
    username :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleBotUsernameIsActive where
  show
    ToggleBotUsernameIsActive
      { is_active = is_active_,
        username = username_,
        bot_user_id = bot_user_id_
      } =
      "ToggleBotUsernameIsActive"
        ++ U.cc
          [ U.p "is_active" is_active_,
            U.p "username" username_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON ToggleBotUsernameIsActive where
  toJSON
    ToggleBotUsernameIsActive
      { is_active = is_active_,
        username = username_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleBotUsernameIsActive",
          "is_active" A..= is_active_,
          "username" A..= username_,
          "bot_user_id" A..= bot_user_id_
        ]
