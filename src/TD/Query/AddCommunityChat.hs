module TD.Query.AddCommunityChat
  (AddCommunityChat(..)
  , defaultAddCommunityChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds a chat to a community. If the current user isn't allowed to change the list of chats in the community, then a request to add the chat is sent to administrators of the community instead and the method fails with the error "COMMUNITY_REQUEST_CREATED". Returns 'TD.Data.Ok.Ok'
data AddCommunityChat
  = AddCommunityChat
    { community_id :: Maybe Int  -- ^ Identifier of the community
    , chat_id      :: Maybe Int  -- ^ Identifier of the chat to add; only chats with owned bots and owned basic group, supergroup and channel chats are allowed; basic group chats will be automatically upgraded to supergroup chats. A community can have up to getOption("community_chat_count_max") supergroup and channel chats and up to getOption("community_bot_count_max") chats with bots; otherwise, the method fails with the error "COMMUNITY_PEERS_TOO_MUCH"
    , is_hidden    :: Maybe Bool -- ^ Pass true if the chat will be visible only to administrators of the community
    }
  deriving (Eq, Show)

instance I.ShortShow AddCommunityChat where
  shortShow
    AddCommunityChat
      { community_id = community_id_
      , chat_id      = chat_id_
      , is_hidden    = is_hidden_
      }
        = "AddCommunityChat"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "chat_id"      `I.p` chat_id_
          , "is_hidden"    `I.p` is_hidden_
          ]

instance AT.ToJSON AddCommunityChat where
  toJSON
    AddCommunityChat
      { community_id = community_id_
      , chat_id      = chat_id_
      , is_hidden    = is_hidden_
      }
        = A.object
          [ "@type"        A..= AT.String "addCommunityChat"
          , "community_id" A..= community_id_
          , "chat_id"      A..= chat_id_
          , "is_hidden"    A..= is_hidden_
          ]

defaultAddCommunityChat :: AddCommunityChat
defaultAddCommunityChat =
  AddCommunityChat
    { community_id = Nothing
    , chat_id      = Nothing
    , is_hidden    = Nothing
    }

