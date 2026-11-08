module TD.Query.ProcessCommunityAddChatRequests
  (ProcessCommunityAddChatRequests(..)
  , defaultProcessCommunityAddChatRequests
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Handles all pending requests to add chats to a community; requires can_edit_chat_list administrator right in the community. Returns 'TD.Data.Ok.Ok'
data ProcessCommunityAddChatRequests
  = ProcessCommunityAddChatRequests
    { community_id :: Maybe Int  -- ^ Identifier of the community
    , approve      :: Maybe Bool -- ^ Pass true to approve all requests and add the chats to the community; pass false to decline them
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessCommunityAddChatRequests where
  shortShow
    ProcessCommunityAddChatRequests
      { community_id = community_id_
      , approve      = approve_
      }
        = "ProcessCommunityAddChatRequests"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "approve"      `I.p` approve_
          ]

instance AT.ToJSON ProcessCommunityAddChatRequests where
  toJSON
    ProcessCommunityAddChatRequests
      { community_id = community_id_
      , approve      = approve_
      }
        = A.object
          [ "@type"        A..= AT.String "processCommunityAddChatRequests"
          , "community_id" A..= community_id_
          , "approve"      A..= approve_
          ]

defaultProcessCommunityAddChatRequests :: ProcessCommunityAddChatRequests
defaultProcessCommunityAddChatRequests =
  ProcessCommunityAddChatRequests
    { community_id = Nothing
    , approve      = Nothing
    }

