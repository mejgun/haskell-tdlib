module TD.Query.ProcessChatJoinRequests
  (ProcessChatJoinRequests(..)
  , defaultProcessChatJoinRequests
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Handles all pending join requests for a given link in a chat. Returns 'TD.Data.Ok.Ok'
data ProcessChatJoinRequests
  = ProcessChatJoinRequests
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , invite_link :: Maybe T.Text -- ^ Invite link for which to process join requests. If empty, all join requests will be processed. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
    , approve     :: Maybe Bool   -- ^ Pass true to approve all requests; pass false to decline them
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessChatJoinRequests where
  shortShow
    ProcessChatJoinRequests
      { chat_id     = chat_id_
      , invite_link = invite_link_
      , approve     = approve_
      }
        = "ProcessChatJoinRequests"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "invite_link" `I.p` invite_link_
          , "approve"     `I.p` approve_
          ]

instance AT.ToJSON ProcessChatJoinRequests where
  toJSON
    ProcessChatJoinRequests
      { chat_id     = chat_id_
      , invite_link = invite_link_
      , approve     = approve_
      }
        = A.object
          [ "@type"       A..= AT.String "processChatJoinRequests"
          , "chat_id"     A..= chat_id_
          , "invite_link" A..= invite_link_
          , "approve"     A..= approve_
          ]

defaultProcessChatJoinRequests :: ProcessChatJoinRequests
defaultProcessChatJoinRequests =
  ProcessChatJoinRequests
    { chat_id     = Nothing
    , invite_link = Nothing
    , approve     = Nothing
    }

