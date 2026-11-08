module TD.Query.ToggleCommunityAreChatsCollapsed
  (ToggleCommunityAreChatsCollapsed(..)
  , defaultToggleCommunityAreChatsCollapsed
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes whether all chats of a community are collapsed into one entry in the chat list. If the chats are expanded, then the community is removed from all chat folders. Returns 'TD.Data.Ok.Ok'
data ToggleCommunityAreChatsCollapsed
  = ToggleCommunityAreChatsCollapsed
    { community_id        :: Maybe Int  -- ^ Identifier of the community
    , are_chats_collapsed :: Maybe Bool -- ^ Pass true to collapse all chats of the community into one entry in the chat list
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleCommunityAreChatsCollapsed where
  shortShow
    ToggleCommunityAreChatsCollapsed
      { community_id        = community_id_
      , are_chats_collapsed = are_chats_collapsed_
      }
        = "ToggleCommunityAreChatsCollapsed"
          ++ I.cc
          [ "community_id"        `I.p` community_id_
          , "are_chats_collapsed" `I.p` are_chats_collapsed_
          ]

instance AT.ToJSON ToggleCommunityAreChatsCollapsed where
  toJSON
    ToggleCommunityAreChatsCollapsed
      { community_id        = community_id_
      , are_chats_collapsed = are_chats_collapsed_
      }
        = A.object
          [ "@type"               A..= AT.String "toggleCommunityAreChatsCollapsed"
          , "community_id"        A..= community_id_
          , "are_chats_collapsed" A..= are_chats_collapsed_
          ]

defaultToggleCommunityAreChatsCollapsed :: ToggleCommunityAreChatsCollapsed
defaultToggleCommunityAreChatsCollapsed =
  ToggleCommunityAreChatsCollapsed
    { community_id        = Nothing
    , are_chats_collapsed = Nothing
    }

