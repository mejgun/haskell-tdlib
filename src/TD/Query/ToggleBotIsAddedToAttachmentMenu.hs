{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleBotIsAddedToAttachmentMenu where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds or removes a bot to attachment menu. Bot can be added to attachment menu, only if userTypeBot.can_be_added_to_attachment_menu == true @bot_user_id Bot's user identifier @is_added Pass true to add the bot to attachment menu; pass false to remove the bot from attachment menu
data ToggleBotIsAddedToAttachmentMenu = ToggleBotIsAddedToAttachmentMenu
  { -- |
    is_added :: Maybe Bool,
    -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleBotIsAddedToAttachmentMenu where
  show
    ToggleBotIsAddedToAttachmentMenu
      { is_added = is_added_,
        bot_user_id = bot_user_id_
      } =
      "ToggleBotIsAddedToAttachmentMenu"
        ++ U.cc
          [ U.p "is_added" is_added_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON ToggleBotIsAddedToAttachmentMenu where
  toJSON
    ToggleBotIsAddedToAttachmentMenu
      { is_added = is_added_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleBotIsAddedToAttachmentMenu",
          "is_added" A..= is_added_,
          "bot_user_id" A..= bot_user_id_
        ]
