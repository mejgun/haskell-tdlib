module TD.Query.ToggleChatGiftNotifications
  (ToggleChatGiftNotifications(..)
  , defaultToggleChatGiftNotifications
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether notifications for new gifts received by a channel chat are sent to the current user; requires can_post_messages administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data ToggleChatGiftNotifications
  = ToggleChatGiftNotifications
    { chat_id     :: Maybe Int  -- ^ Identifier of the channel chat
    , are_enabled :: Maybe Bool -- ^ Pass true to enable notifications about new gifts owned by the channel chat; pass false to disable the notifications
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleChatGiftNotifications where
  shortShow
    ToggleChatGiftNotifications
      { chat_id     = chat_id_
      , are_enabled = are_enabled_
      }
        = "ToggleChatGiftNotifications"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "are_enabled" `I.p` are_enabled_
          ]

instance AT.ToJSON ToggleChatGiftNotifications where
  toJSON
    ToggleChatGiftNotifications
      { chat_id     = chat_id_
      , are_enabled = are_enabled_
      }
        = A.object
          [ "@type"       A..= AT.String "toggleChatGiftNotifications"
          , "chat_id"     A..= chat_id_
          , "are_enabled" A..= are_enabled_
          ]

defaultToggleChatGiftNotifications :: ToggleChatGiftNotifications
defaultToggleChatGiftNotifications =
  ToggleChatGiftNotifications
    { chat_id     = Nothing
    , are_enabled = Nothing
    }

