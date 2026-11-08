module TD.Query.GetCommunityAddChatRequests
  (GetCommunityAddChatRequests(..)
  , defaultGetCommunityAddChatRequests
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns pending requests to add chats to a community. Administrators of the community with can_edit_chat_list right receive all requests; other users receive only requests sent by them. Returns 'TD.Data.CommunityAddChatRequests.CommunityAddChatRequests'
data GetCommunityAddChatRequests
  = GetCommunityAddChatRequests
    { community_id :: Maybe Int    -- ^ Identifier of the community
    , offset       :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit        :: Maybe Int    -- ^ The maximum number of requests to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetCommunityAddChatRequests where
  shortShow
    GetCommunityAddChatRequests
      { community_id = community_id_
      , offset       = offset_
      , limit        = limit_
      }
        = "GetCommunityAddChatRequests"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "offset"       `I.p` offset_
          , "limit"        `I.p` limit_
          ]

instance AT.ToJSON GetCommunityAddChatRequests where
  toJSON
    GetCommunityAddChatRequests
      { community_id = community_id_
      , offset       = offset_
      , limit        = limit_
      }
        = A.object
          [ "@type"        A..= AT.String "getCommunityAddChatRequests"
          , "community_id" A..= community_id_
          , "offset"       A..= offset_
          , "limit"        A..= limit_
          ]

defaultGetCommunityAddChatRequests :: GetCommunityAddChatRequests
defaultGetCommunityAddChatRequests =
  GetCommunityAddChatRequests
    { community_id = Nothing
    , offset       = Nothing
    , limit        = Nothing
    }

