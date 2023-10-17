module TD.Data.BotCommandScope
  (BotCommandScope(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents the scope to which bot commands are relevant
data BotCommandScope
  = BotCommandScopeDefault -- ^ A scope covering all users
  | BotCommandScopeAllPrivateChats -- ^ A scope covering all private chats
  | BotCommandScopeAllGroupChats -- ^ A scope covering all group and supergroup chats
  | BotCommandScopeAllChatAdministrators -- ^ A scope covering all group and supergroup chat administrators
  | BotCommandScopeChat -- ^ A scope covering all members of a chat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  | BotCommandScopeChatAdministrators -- ^ A scope covering all administrators of a chat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  | BotCommandScopeChatMember -- ^ A scope covering a member of a chat
    { chat_id :: Maybe Int -- ^ Chat identifier
    , user_id :: Maybe Int -- ^ User identifier
    }
  deriving (Eq, Show)

instance I.ShortShow BotCommandScope where
  shortShow BotCommandScopeDefault
      = "BotCommandScopeDefault"
  shortShow BotCommandScopeAllPrivateChats
      = "BotCommandScopeAllPrivateChats"
  shortShow BotCommandScopeAllGroupChats
      = "BotCommandScopeAllGroupChats"
  shortShow BotCommandScopeAllChatAdministrators
      = "BotCommandScopeAllChatAdministrators"
  shortShow BotCommandScopeChat
    { chat_id = chat_id_
    }
      = "BotCommandScopeChat"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow BotCommandScopeChatAdministrators
    { chat_id = chat_id_
    }
      = "BotCommandScopeChatAdministrators"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow BotCommandScopeChatMember
    { chat_id = chat_id_
    , user_id = user_id_
    }
      = "BotCommandScopeChatMember"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        , "user_id" `I.p` user_id_
        ]

instance AT.FromJSON BotCommandScope where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botCommandScopeDefault"               -> pure BotCommandScopeDefault
      "botCommandScopeAllPrivateChats"       -> pure BotCommandScopeAllPrivateChats
      "botCommandScopeAllGroupChats"         -> pure BotCommandScopeAllGroupChats
      "botCommandScopeAllChatAdministrators" -> pure BotCommandScopeAllChatAdministrators
      "botCommandScopeChat"                  -> parseBotCommandScopeChat v
      "botCommandScopeChatAdministrators"    -> parseBotCommandScopeChatAdministrators v
      "botCommandScopeChatMember"            -> parseBotCommandScopeChatMember v
      _                                      -> mempty
    
    where
      parseBotCommandScopeChat :: A.Value -> AT.Parser BotCommandScope
      parseBotCommandScopeChat = A.withObject "BotCommandScopeChat" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ BotCommandScopeChat
          { chat_id = chat_id_
          }
      parseBotCommandScopeChatAdministrators :: A.Value -> AT.Parser BotCommandScope
      parseBotCommandScopeChatAdministrators = A.withObject "BotCommandScopeChatAdministrators" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ BotCommandScopeChatAdministrators
          { chat_id = chat_id_
          }
      parseBotCommandScopeChatMember :: A.Value -> AT.Parser BotCommandScope
      parseBotCommandScopeChatMember = A.withObject "BotCommandScopeChatMember" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        user_id_ <- o A..:?  "user_id"
        pure $ BotCommandScopeChatMember
          { chat_id = chat_id_
          , user_id = user_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON BotCommandScope where
  toJSON BotCommandScopeDefault
      = A.object
        [ "@type" A..= AT.String "botCommandScopeDefault"
        ]
  toJSON BotCommandScopeAllPrivateChats
      = A.object
        [ "@type" A..= AT.String "botCommandScopeAllPrivateChats"
        ]
  toJSON BotCommandScopeAllGroupChats
      = A.object
        [ "@type" A..= AT.String "botCommandScopeAllGroupChats"
        ]
  toJSON BotCommandScopeAllChatAdministrators
      = A.object
        [ "@type" A..= AT.String "botCommandScopeAllChatAdministrators"
        ]
  toJSON BotCommandScopeChat
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "botCommandScopeChat"
        , "chat_id" A..= chat_id_
        ]
  toJSON BotCommandScopeChatAdministrators
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "botCommandScopeChatAdministrators"
        , "chat_id" A..= chat_id_
        ]
  toJSON BotCommandScopeChatMember
    { chat_id = chat_id_
    , user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "botCommandScopeChatMember"
        , "chat_id" A..= chat_id_
        , "user_id" A..= user_id_
        ]

