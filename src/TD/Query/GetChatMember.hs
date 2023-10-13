module TD.Query.GetChatMember(GetChatMember(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data GetChatMember -- ^ Returns information about a single member of a chat
  = GetChatMember
    { chat_id   :: Maybe Int                         -- ^ Chat identifier
    , member_id :: Maybe MessageSender.MessageSender -- ^ Member identifier
    }
  deriving (Eq)

instance Show GetChatMember where
  show
    GetChatMember
      { chat_id   = chat_id_
      , member_id = member_id_
      }
        = "GetChatMember"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "member_id" `I.p` member_id_
          ]

instance AT.ToJSON GetChatMember where
  toJSON
    GetChatMember
      { chat_id   = chat_id_
      , member_id = member_id_
      }
        = A.object
          [ "@type"     A..= AT.String "getChatMember"
          , "chat_id"   A..= chat_id_
          , "member_id" A..= member_id_
          ]
