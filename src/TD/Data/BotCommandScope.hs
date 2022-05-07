{-# LANGUAGE OverloadedStrings #-}

module TD.Data.BotCommandScope where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the scope to which bot commands are relevant
data BotCommandScope
  = -- | A scope covering all users
    BotCommandScopeDefault
  | -- | A scope covering all private chats
    BotCommandScopeAllPrivateChats
  | -- | A scope covering all group and supergroup chats
    BotCommandScopeAllGroupChats
  | -- | A scope covering all group and supergroup chat administrators
    BotCommandScopeAllChatAdministrators
  | -- | A scope covering all members of a chat @chat_id Chat identifier
    BotCommandScopeChat
      { -- |
        chat_id :: Maybe Int
      }
  | -- | A scope covering all administrators of a chat @chat_id Chat identifier
    BotCommandScopeChatAdministrators
      { -- |
        chat_id :: Maybe Int
      }
  | -- | A scope covering a member of a chat @chat_id Chat identifier @user_id User identifier
    BotCommandScopeChatMember
      { -- |
        user_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show BotCommandScope where
  show BotCommandScopeDefault =
    "BotCommandScopeDefault"
      ++ U.cc
        []
  show BotCommandScopeAllPrivateChats =
    "BotCommandScopeAllPrivateChats"
      ++ U.cc
        []
  show BotCommandScopeAllGroupChats =
    "BotCommandScopeAllGroupChats"
      ++ U.cc
        []
  show BotCommandScopeAllChatAdministrators =
    "BotCommandScopeAllChatAdministrators"
      ++ U.cc
        []
  show
    BotCommandScopeChat
      { chat_id = chat_id
      } =
      "BotCommandScopeChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]
  show
    BotCommandScopeChatAdministrators
      { chat_id = chat_id
      } =
      "BotCommandScopeChatAdministrators"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]
  show
    BotCommandScopeChatMember
      { user_id = user_id,
        chat_id = chat_id
      } =
      "BotCommandScopeChatMember"
        ++ U.cc
          [ U.p "user_id" user_id,
            U.p "chat_id" chat_id
          ]

instance T.FromJSON BotCommandScope where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "botCommandScopeDefault" -> parseBotCommandScopeDefault v
      "botCommandScopeAllPrivateChats" -> parseBotCommandScopeAllPrivateChats v
      "botCommandScopeAllGroupChats" -> parseBotCommandScopeAllGroupChats v
      "botCommandScopeAllChatAdministrators" -> parseBotCommandScopeAllChatAdministrators v
      "botCommandScopeChat" -> parseBotCommandScopeChat v
      "botCommandScopeChatAdministrators" -> parseBotCommandScopeChatAdministrators v
      "botCommandScopeChatMember" -> parseBotCommandScopeChatMember v
      _ -> mempty
    where
      parseBotCommandScopeDefault :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeDefault = A.withObject "BotCommandScopeDefault" $ \o -> do
        return $ BotCommandScopeDefault {}

      parseBotCommandScopeAllPrivateChats :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeAllPrivateChats = A.withObject "BotCommandScopeAllPrivateChats" $ \o -> do
        return $ BotCommandScopeAllPrivateChats {}

      parseBotCommandScopeAllGroupChats :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeAllGroupChats = A.withObject "BotCommandScopeAllGroupChats" $ \o -> do
        return $ BotCommandScopeAllGroupChats {}

      parseBotCommandScopeAllChatAdministrators :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeAllChatAdministrators = A.withObject "BotCommandScopeAllChatAdministrators" $ \o -> do
        return $ BotCommandScopeAllChatAdministrators {}

      parseBotCommandScopeChat :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeChat = A.withObject "BotCommandScopeChat" $ \o -> do
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ BotCommandScopeChat {chat_id = chat_id_}

      parseBotCommandScopeChatAdministrators :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeChatAdministrators = A.withObject "BotCommandScopeChatAdministrators" $ \o -> do
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ BotCommandScopeChatAdministrators {chat_id = chat_id_}

      parseBotCommandScopeChatMember :: A.Value -> T.Parser BotCommandScope
      parseBotCommandScopeChatMember = A.withObject "BotCommandScopeChatMember" $ \o -> do
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ BotCommandScopeChatMember {user_id = user_id_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON BotCommandScope where
  toJSON BotCommandScopeDefault =
    A.object
      [ "@type" A..= T.String "botCommandScopeDefault"
      ]
  toJSON BotCommandScopeAllPrivateChats =
    A.object
      [ "@type" A..= T.String "botCommandScopeAllPrivateChats"
      ]
  toJSON BotCommandScopeAllGroupChats =
    A.object
      [ "@type" A..= T.String "botCommandScopeAllGroupChats"
      ]
  toJSON BotCommandScopeAllChatAdministrators =
    A.object
      [ "@type" A..= T.String "botCommandScopeAllChatAdministrators"
      ]
  toJSON
    BotCommandScopeChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "botCommandScopeChat",
          "chat_id" A..= chat_id
        ]
  toJSON
    BotCommandScopeChatAdministrators
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "botCommandScopeChatAdministrators",
          "chat_id" A..= chat_id
        ]
  toJSON
    BotCommandScopeChatMember
      { user_id = user_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "botCommandScopeChatMember",
          "user_id" A..= user_id,
          "chat_id" A..= chat_id
        ]
