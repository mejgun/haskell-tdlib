module TD.Query.ShareChatWithBot
  (ShareChatWithBot(..)
  , defaultShareChatWithBot
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.KeyboardButtonSource as KeyboardButtonSource

-- | Shares a chat after pressing a keyboardButtonTypeRequestChat button with the bot. Returns 'TD.Data.Ok.Ok'
data ShareChatWithBot
  = ShareChatWithBot
    { source         :: Maybe KeyboardButtonSource.KeyboardButtonSource -- ^ Source of the button
    , button_id      :: Maybe Int                                       -- ^ Identifier of the button
    , shared_chat_id :: Maybe Int                                       -- ^ Identifier of the shared chat
    , only_check     :: Maybe Bool                                      -- ^ Pass true to check that the chat can be shared by the button instead of actually sharing it. Doesn't check bot_is_member and bot_administrator_rights restrictions. If the bot must be a member, then all chats from getGroupsInCommon and all chats, where the user can add the bot, are suitable. In the latter case the bot will be automatically added to the chat. If the bot must be an administrator, then all chats, where the bot already has requested rights or can be added to administrators by the user, are suitable. In the latter case the bot will be automatically granted requested rights
    }
  deriving (Eq, Show)

instance I.ShortShow ShareChatWithBot where
  shortShow
    ShareChatWithBot
      { source         = source_
      , button_id      = button_id_
      , shared_chat_id = shared_chat_id_
      , only_check     = only_check_
      }
        = "ShareChatWithBot"
          ++ I.cc
          [ "source"         `I.p` source_
          , "button_id"      `I.p` button_id_
          , "shared_chat_id" `I.p` shared_chat_id_
          , "only_check"     `I.p` only_check_
          ]

instance AT.ToJSON ShareChatWithBot where
  toJSON
    ShareChatWithBot
      { source         = source_
      , button_id      = button_id_
      , shared_chat_id = shared_chat_id_
      , only_check     = only_check_
      }
        = A.object
          [ "@type"          A..= AT.String "shareChatWithBot"
          , "source"         A..= source_
          , "button_id"      A..= button_id_
          , "shared_chat_id" A..= shared_chat_id_
          , "only_check"     A..= only_check_
          ]

defaultShareChatWithBot :: ShareChatWithBot
defaultShareChatWithBot =
  ShareChatWithBot
    { source         = Nothing
    , button_id      = Nothing
    , shared_chat_id = Nothing
    , only_check     = Nothing
    }

