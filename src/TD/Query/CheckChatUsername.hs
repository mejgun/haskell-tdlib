module TD.Query.CheckChatUsername(CheckChatUsername(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CheckChatUsername -- ^ Checks whether a username can be set for a chat
  = CheckChatUsername
    { chat_id  :: Maybe Int    -- ^ Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if the chat is being created
    , username :: Maybe T.Text -- ^ Username to be checked
    }
  deriving (Eq)

instance Show CheckChatUsername where
  show
    CheckChatUsername
      { chat_id  = chat_id_
      , username = username_
      }
        = "CheckChatUsername"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "username" `I.p` username_
          ]

instance AT.ToJSON CheckChatUsername where
  toJSON
    CheckChatUsername
      { chat_id  = chat_id_
      , username = username_
      }
        = A.object
          [ "@type"    A..= AT.String "checkChatUsername"
          , "chat_id"  A..= chat_id_
          , "username" A..= username_
          ]
