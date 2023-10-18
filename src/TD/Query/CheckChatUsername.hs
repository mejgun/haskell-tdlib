module TD.Query.CheckChatUsername
  (CheckChatUsername(..)
  , defaultCheckChatUsername
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks whether a username can be set for a chat. Returns 'TD.Data.CheckChatUsernameResult.CheckChatUsernameResult'
data CheckChatUsername
  = CheckChatUsername
    { chat_id  :: Maybe Int    -- ^ Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or 0 if the chat is being created
    , username :: Maybe T.Text -- ^ Username to be checked
    }
  deriving (Eq, Show)

instance I.ShortShow CheckChatUsername where
  shortShow
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

defaultCheckChatUsername :: CheckChatUsername
defaultCheckChatUsername =
  CheckChatUsername
    { chat_id  = Nothing
    , username = Nothing
    }

