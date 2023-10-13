module TD.Query.ToggleBotIsAddedToAttachmentMenu(ToggleBotIsAddedToAttachmentMenu(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleBotIsAddedToAttachmentMenu -- ^ Adds or removes a bot to attachment menu. Bot can be added to attachment menu, only if userTypeBot.can_be_added_to_attachment_menu == true
  = ToggleBotIsAddedToAttachmentMenu
    { bot_user_id        :: Maybe Int  -- ^ Bot's user identifier
    , is_added           :: Maybe Bool -- ^ Pass true to add the bot to attachment menu; pass false to remove the bot from attachment menu
    , allow_write_access :: Maybe Bool -- ^ Pass true if the current user allowed the bot to send them messages. Ignored if is_added is false
    }
  deriving (Eq)

instance Show ToggleBotIsAddedToAttachmentMenu where
  show
    ToggleBotIsAddedToAttachmentMenu
      { bot_user_id        = bot_user_id_
      , is_added           = is_added_
      , allow_write_access = allow_write_access_
      }
        = "ToggleBotIsAddedToAttachmentMenu"
          ++ I.cc
          [ "bot_user_id"        `I.p` bot_user_id_
          , "is_added"           `I.p` is_added_
          , "allow_write_access" `I.p` allow_write_access_
          ]

instance AT.ToJSON ToggleBotIsAddedToAttachmentMenu where
  toJSON
    ToggleBotIsAddedToAttachmentMenu
      { bot_user_id        = bot_user_id_
      , is_added           = is_added_
      , allow_write_access = allow_write_access_
      }
        = A.object
          [ "@type"              A..= AT.String "toggleBotIsAddedToAttachmentMenu"
          , "bot_user_id"        A..= bot_user_id_
          , "is_added"           A..= is_added_
          , "allow_write_access" A..= allow_write_access_
          ]
