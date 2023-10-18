module TD.Query.ShareChatWithBot
  (ShareChatWithBot(..)
  , defaultShareChatWithBot
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Shares a chat after pressing a keyboardButtonTypeRequestChat button with the bot. Returns 'TD.Data.Ok.Ok'
data ShareChatWithBot
  = ShareChatWithBot
    { chat_id        :: Maybe Int  -- ^ Identifier of the chat with the bot
    , message_id     :: Maybe Int  -- ^ Identifier of the message with the button
    , button_id      :: Maybe Int  -- ^ Identifier of the button
    , shared_chat_id :: Maybe Int  -- ^ Identifier of the shared chat
    , only_check     :: Maybe Bool -- ^ Pass true to check that the chat can be shared by the button instead of actually sharing it. Doesn't check bot_is_member and bot_administrator_rights restrictions. If the bot must be a member, then all chats from getGroupsInCommon and all chats, where the user can add the bot, are suitable. In the latter case the bot will be automatically added to the chat. If the bot must be an administrator, then all chats, where the bot already has requested rights or can be added to administrators by the user, are suitable. In the latter case the bot will be automatically granted requested rights
    }
  deriving (Eq, Show)

instance I.ShortShow ShareChatWithBot where
  shortShow
    ShareChatWithBot
      { chat_id        = chat_id_
      , message_id     = message_id_
      , button_id      = button_id_
      , shared_chat_id = shared_chat_id_
      , only_check     = only_check_
      }
        = "ShareChatWithBot"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "message_id"     `I.p` message_id_
          , "button_id"      `I.p` button_id_
          , "shared_chat_id" `I.p` shared_chat_id_
          , "only_check"     `I.p` only_check_
          ]

instance AT.ToJSON ShareChatWithBot where
  toJSON
    ShareChatWithBot
      { chat_id        = chat_id_
      , message_id     = message_id_
      , button_id      = button_id_
      , shared_chat_id = shared_chat_id_
      , only_check     = only_check_
      }
        = A.object
          [ "@type"          A..= AT.String "shareChatWithBot"
          , "chat_id"        A..= chat_id_
          , "message_id"     A..= message_id_
          , "button_id"      A..= button_id_
          , "shared_chat_id" A..= shared_chat_id_
          , "only_check"     A..= only_check_
          ]

defaultShareChatWithBot :: ShareChatWithBot
defaultShareChatWithBot =
  ShareChatWithBot
    { chat_id        = Nothing
    , message_id     = Nothing
    , button_id      = Nothing
    , shared_chat_id = Nothing
    , only_check     = Nothing
    }

