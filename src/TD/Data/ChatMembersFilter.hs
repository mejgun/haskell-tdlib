{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatMembersFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Specifies the kind of chat members to return in searchChatMembers
data ChatMembersFilter
  = -- | Returns contacts of the user
    ChatMembersFilterContacts
  | -- | Returns the owner and administrators
    ChatMembersFilterAdministrators
  | -- | Returns all chat members, including restricted chat members
    ChatMembersFilterMembers
  | -- | Returns users which can be mentioned in the chat @message_thread_id If non-zero, the identifier of the current message thread
    ChatMembersFilterMention
      { -- |
        message_thread_id :: Maybe Int
      }
  | -- | Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup
    ChatMembersFilterRestricted
  | -- | Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel
    ChatMembersFilterBanned
  | -- | Returns bot members of the chat
    ChatMembersFilterBots
  deriving (Eq)

instance Show ChatMembersFilter where
  show ChatMembersFilterContacts =
    "ChatMembersFilterContacts"
      ++ U.cc
        []
  show ChatMembersFilterAdministrators =
    "ChatMembersFilterAdministrators"
      ++ U.cc
        []
  show ChatMembersFilterMembers =
    "ChatMembersFilterMembers"
      ++ U.cc
        []
  show
    ChatMembersFilterMention
      { message_thread_id = message_thread_id_
      } =
      "ChatMembersFilterMention"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_
          ]
  show ChatMembersFilterRestricted =
    "ChatMembersFilterRestricted"
      ++ U.cc
        []
  show ChatMembersFilterBanned =
    "ChatMembersFilterBanned"
      ++ U.cc
        []
  show ChatMembersFilterBots =
    "ChatMembersFilterBots"
      ++ U.cc
        []

instance T.FromJSON ChatMembersFilter where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMembersFilterContacts" -> parseChatMembersFilterContacts v
      "chatMembersFilterAdministrators" -> parseChatMembersFilterAdministrators v
      "chatMembersFilterMembers" -> parseChatMembersFilterMembers v
      "chatMembersFilterMention" -> parseChatMembersFilterMention v
      "chatMembersFilterRestricted" -> parseChatMembersFilterRestricted v
      "chatMembersFilterBanned" -> parseChatMembersFilterBanned v
      "chatMembersFilterBots" -> parseChatMembersFilterBots v
      _ -> mempty
    where
      parseChatMembersFilterContacts :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterContacts = A.withObject "ChatMembersFilterContacts" $ \_ -> return ChatMembersFilterContacts

      parseChatMembersFilterAdministrators :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterAdministrators = A.withObject "ChatMembersFilterAdministrators" $ \_ -> return ChatMembersFilterAdministrators

      parseChatMembersFilterMembers :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterMembers = A.withObject "ChatMembersFilterMembers" $ \_ -> return ChatMembersFilterMembers

      parseChatMembersFilterMention :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterMention = A.withObject "ChatMembersFilterMention" $ \o -> do
        message_thread_id_ <- o A..:? "message_thread_id"
        return $ ChatMembersFilterMention {message_thread_id = message_thread_id_}

      parseChatMembersFilterRestricted :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterRestricted = A.withObject "ChatMembersFilterRestricted" $ \_ -> return ChatMembersFilterRestricted

      parseChatMembersFilterBanned :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterBanned = A.withObject "ChatMembersFilterBanned" $ \_ -> return ChatMembersFilterBanned

      parseChatMembersFilterBots :: A.Value -> T.Parser ChatMembersFilter
      parseChatMembersFilterBots = A.withObject "ChatMembersFilterBots" $ \_ -> return ChatMembersFilterBots
  parseJSON _ = mempty

instance T.ToJSON ChatMembersFilter where
  toJSON ChatMembersFilterContacts =
    A.object
      [ "@type" A..= T.String "chatMembersFilterContacts"
      ]
  toJSON ChatMembersFilterAdministrators =
    A.object
      [ "@type" A..= T.String "chatMembersFilterAdministrators"
      ]
  toJSON ChatMembersFilterMembers =
    A.object
      [ "@type" A..= T.String "chatMembersFilterMembers"
      ]
  toJSON
    ChatMembersFilterMention
      { message_thread_id = message_thread_id_
      } =
      A.object
        [ "@type" A..= T.String "chatMembersFilterMention",
          "message_thread_id" A..= message_thread_id_
        ]
  toJSON ChatMembersFilterRestricted =
    A.object
      [ "@type" A..= T.String "chatMembersFilterRestricted"
      ]
  toJSON ChatMembersFilterBanned =
    A.object
      [ "@type" A..= T.String "chatMembersFilterBanned"
      ]
  toJSON ChatMembersFilterBots =
    A.object
      [ "@type" A..= T.String "chatMembersFilterBots"
      ]
