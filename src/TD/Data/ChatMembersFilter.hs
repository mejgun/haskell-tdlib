module TD.Data.ChatMembersFilter
  (ChatMembersFilter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Specifies the kind of chat members to return in searchChatMembers
data ChatMembersFilter
  = ChatMembersFilterContacts -- ^ Returns contacts of the user
  | ChatMembersFilterAdministrators -- ^ Returns the owner and administrators
  | ChatMembersFilterMembers -- ^ Returns all chat members, including restricted chat members
  | ChatMembersFilterMention -- ^ Returns users which can be mentioned in the chat
    { message_thread_id :: Maybe Int -- ^ If non-zero, the identifier of the current message thread
    }
  | ChatMembersFilterRestricted -- ^ Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup
  | ChatMembersFilterBanned -- ^ Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel
  | ChatMembersFilterBots -- ^ Returns bot members of the chat
  deriving (Eq, Show)

instance I.ShortShow ChatMembersFilter where
  shortShow ChatMembersFilterContacts
      = "ChatMembersFilterContacts"
  shortShow ChatMembersFilterAdministrators
      = "ChatMembersFilterAdministrators"
  shortShow ChatMembersFilterMembers
      = "ChatMembersFilterMembers"
  shortShow ChatMembersFilterMention
    { message_thread_id = message_thread_id_
    }
      = "ChatMembersFilterMention"
        ++ I.cc
        [ "message_thread_id" `I.p` message_thread_id_
        ]
  shortShow ChatMembersFilterRestricted
      = "ChatMembersFilterRestricted"
  shortShow ChatMembersFilterBanned
      = "ChatMembersFilterBanned"
  shortShow ChatMembersFilterBots
      = "ChatMembersFilterBots"

instance AT.FromJSON ChatMembersFilter where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatMembersFilterContacts"       -> pure ChatMembersFilterContacts
      "chatMembersFilterAdministrators" -> pure ChatMembersFilterAdministrators
      "chatMembersFilterMembers"        -> pure ChatMembersFilterMembers
      "chatMembersFilterMention"        -> parseChatMembersFilterMention v
      "chatMembersFilterRestricted"     -> pure ChatMembersFilterRestricted
      "chatMembersFilterBanned"         -> pure ChatMembersFilterBanned
      "chatMembersFilterBots"           -> pure ChatMembersFilterBots
      _                                 -> mempty
    
    where
      parseChatMembersFilterMention :: A.Value -> AT.Parser ChatMembersFilter
      parseChatMembersFilterMention = A.withObject "ChatMembersFilterMention" $ \o -> do
        message_thread_id_ <- o A..:?  "message_thread_id"
        pure $ ChatMembersFilterMention
          { message_thread_id = message_thread_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatMembersFilter where
  toJSON ChatMembersFilterContacts
      = A.object
        [ "@type" A..= AT.String "chatMembersFilterContacts"
        ]
  toJSON ChatMembersFilterAdministrators
      = A.object
        [ "@type" A..= AT.String "chatMembersFilterAdministrators"
        ]
  toJSON ChatMembersFilterMembers
      = A.object
        [ "@type" A..= AT.String "chatMembersFilterMembers"
        ]
  toJSON ChatMembersFilterMention
    { message_thread_id = message_thread_id_
    }
      = A.object
        [ "@type"             A..= AT.String "chatMembersFilterMention"
        , "message_thread_id" A..= message_thread_id_
        ]
  toJSON ChatMembersFilterRestricted
      = A.object
        [ "@type" A..= AT.String "chatMembersFilterRestricted"
        ]
  toJSON ChatMembersFilterBanned
      = A.object
        [ "@type" A..= AT.String "chatMembersFilterBanned"
        ]
  toJSON ChatMembersFilterBots
      = A.object
        [ "@type" A..= AT.String "chatMembersFilterBots"
        ]

