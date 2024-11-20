module TD.Query.ToggleBotCanManageEmojiStatus
  (ToggleBotCanManageEmojiStatus(..)
  , defaultToggleBotCanManageEmojiStatus
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether the bot can manage emoji status of the current user. Returns 'TD.Data.Ok.Ok'
data ToggleBotCanManageEmojiStatus
  = ToggleBotCanManageEmojiStatus
    { bot_user_id             :: Maybe Int  -- ^ User identifier of the bot
    , can_manage_emoji_status :: Maybe Bool -- ^ Pass true if the bot is allowed to change emoji status of the user; pass false otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleBotCanManageEmojiStatus where
  shortShow
    ToggleBotCanManageEmojiStatus
      { bot_user_id             = bot_user_id_
      , can_manage_emoji_status = can_manage_emoji_status_
      }
        = "ToggleBotCanManageEmojiStatus"
          ++ I.cc
          [ "bot_user_id"             `I.p` bot_user_id_
          , "can_manage_emoji_status" `I.p` can_manage_emoji_status_
          ]

instance AT.ToJSON ToggleBotCanManageEmojiStatus where
  toJSON
    ToggleBotCanManageEmojiStatus
      { bot_user_id             = bot_user_id_
      , can_manage_emoji_status = can_manage_emoji_status_
      }
        = A.object
          [ "@type"                   A..= AT.String "toggleBotCanManageEmojiStatus"
          , "bot_user_id"             A..= bot_user_id_
          , "can_manage_emoji_status" A..= can_manage_emoji_status_
          ]

defaultToggleBotCanManageEmojiStatus :: ToggleBotCanManageEmojiStatus
defaultToggleBotCanManageEmojiStatus =
  ToggleBotCanManageEmojiStatus
    { bot_user_id             = Nothing
    , can_manage_emoji_status = Nothing
    }

