module TD.Query.GetChatJoinRequests
  (GetChatJoinRequests(..)
  , defaultGetChatJoinRequests
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest

-- | Returns pending join requests in a chat. Returns 'TD.Data.ChatJoinRequests.ChatJoinRequests'
data GetChatJoinRequests
  = GetChatJoinRequests
    { chat_id        :: Maybe Int                             -- ^ Chat identifier
    , invite_link    :: Maybe T.Text                          -- ^ Invite link for which to return join requests. If empty, all join requests will be returned. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
    , query          :: Maybe T.Text                          -- ^ A query to search for in the first names, last names and usernames of the users to return
    , offset_request :: Maybe ChatJoinRequest.ChatJoinRequest -- ^ A chat join request from which to return next requests; pass null to get results from the beginning
    , limit          :: Maybe Int                             -- ^ The maximum number of requests to join the chat to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatJoinRequests where
  shortShow
    GetChatJoinRequests
      { chat_id        = chat_id_
      , invite_link    = invite_link_
      , query          = query_
      , offset_request = offset_request_
      , limit          = limit_
      }
        = "GetChatJoinRequests"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "invite_link"    `I.p` invite_link_
          , "query"          `I.p` query_
          , "offset_request" `I.p` offset_request_
          , "limit"          `I.p` limit_
          ]

instance AT.ToJSON GetChatJoinRequests where
  toJSON
    GetChatJoinRequests
      { chat_id        = chat_id_
      , invite_link    = invite_link_
      , query          = query_
      , offset_request = offset_request_
      , limit          = limit_
      }
        = A.object
          [ "@type"          A..= AT.String "getChatJoinRequests"
          , "chat_id"        A..= chat_id_
          , "invite_link"    A..= invite_link_
          , "query"          A..= query_
          , "offset_request" A..= offset_request_
          , "limit"          A..= limit_
          ]

defaultGetChatJoinRequests :: GetChatJoinRequests
defaultGetChatJoinRequests =
  GetChatJoinRequests
    { chat_id        = Nothing
    , invite_link    = Nothing
    , query          = Nothing
    , offset_request = Nothing
    , limit          = Nothing
    }

