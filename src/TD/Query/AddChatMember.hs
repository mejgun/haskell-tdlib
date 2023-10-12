module TD.Query.AddChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data AddChatMember -- ^ Adds a new member to a chat. Members can't be added to private or secret chats
  = AddChatMember
    { chat_id       :: Maybe Int -- ^ Chat identifier
    , user_id       :: Maybe Int -- ^ Identifier of the user
    , forward_limit :: Maybe Int -- ^ The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
    }
  deriving (Eq)

instance Show AddChatMember where
  show
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
