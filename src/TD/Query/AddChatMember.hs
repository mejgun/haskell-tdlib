module TD.Query.AddChatMember
  (AddChatMember(..)
  , defaultAddChatMember
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds a new member to a chat; requires can_invite_users member right. Members can't be added to private or secret chats. Returns information about members that weren't added. Returns 'TD.Data.FailedToAddMembers.FailedToAddMembers'
data AddChatMember
  = AddChatMember
    { chat_id       :: Maybe Int -- ^ Chat identifier
    , user_id       :: Maybe Int -- ^ Identifier of the user
    , forward_limit :: Maybe Int -- ^ The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
    }
  deriving (Eq, Show)

instance I.ShortShow AddChatMember where
  shortShow
    AddChatMember
      { chat_id       = chat_id_
      , user_id       = user_id_
      , forward_limit = forward_limit_
      }
        = "AddChatMember"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "user_id"       `I.p` user_id_
          , "forward_limit" `I.p` forward_limit_
          ]

instance AT.ToJSON AddChatMember where
  toJSON
    AddChatMember
      { chat_id       = chat_id_
      , user_id       = user_id_
      , forward_limit = forward_limit_
      }
        = A.object
          [ "@type"         A..= AT.String "addChatMember"
          , "chat_id"       A..= chat_id_
          , "user_id"       A..= user_id_
          , "forward_limit" A..= forward_limit_
          ]

defaultAddChatMember :: AddChatMember
defaultAddChatMember =
  AddChatMember
    { chat_id       = Nothing
    , user_id       = Nothing
    , forward_limit = Nothing
    }

