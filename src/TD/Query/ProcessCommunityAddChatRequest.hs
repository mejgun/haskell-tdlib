module TD.Query.ProcessCommunityAddChatRequest
  (ProcessCommunityAddChatRequest(..)
  , defaultProcessCommunityAddChatRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Handles a pending request to add a chat to a community; requires can_edit_chat_list administrator right in the community. Returns 'TD.Data.Ok.Ok'
data ProcessCommunityAddChatRequest
  = ProcessCommunityAddChatRequest
    { community_id :: Maybe Int  -- ^ Identifier of the community
    , chat_id      :: Maybe Int  -- ^ Identifier of the chat from the request
    , approve      :: Maybe Bool -- ^ Pass true to approve the request and add the chat to the community; pass false to decline it. If the community already has the maximum number of chats, then approval fails with the error "COMMUNITY_PEERS_TOO_MUCH"
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessCommunityAddChatRequest where
  shortShow
    ProcessCommunityAddChatRequest
      { community_id = community_id_
      , chat_id      = chat_id_
      , approve      = approve_
      }
        = "ProcessCommunityAddChatRequest"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "chat_id"      `I.p` chat_id_
          , "approve"      `I.p` approve_
          ]

instance AT.ToJSON ProcessCommunityAddChatRequest where
  toJSON
    ProcessCommunityAddChatRequest
      { community_id = community_id_
      , chat_id      = chat_id_
      , approve      = approve_
      }
        = A.object
          [ "@type"        A..= AT.String "processCommunityAddChatRequest"
          , "community_id" A..= community_id_
          , "chat_id"      A..= chat_id_
          , "approve"      A..= approve_
          ]

defaultProcessCommunityAddChatRequest :: ProcessCommunityAddChatRequest
defaultProcessCommunityAddChatRequest =
  ProcessCommunityAddChatRequest
    { community_id = Nothing
    , chat_id      = Nothing
    , approve      = Nothing
    }

