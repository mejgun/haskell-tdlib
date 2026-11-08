module TD.Query.RemoveCommunityChat
  (RemoveCommunityChat(..)
  , defaultRemoveCommunityChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a chat from a community. Members of the chat, which aren't members of other chats in the community, will be removed from the community. Requires owner privileges in the supergroup or channel chat, or ownership of the bot for chats with bots, or can_edit_chat_list administrator right in the community. Returns 'TD.Data.Ok.Ok'
data RemoveCommunityChat
  = RemoveCommunityChat
    { community_id :: Maybe Int -- ^ Identifier of the community
    , chat_id      :: Maybe Int -- ^ Identifier of the chat to remove
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveCommunityChat where
  shortShow
    RemoveCommunityChat
      { community_id = community_id_
      , chat_id      = chat_id_
      }
        = "RemoveCommunityChat"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "chat_id"      `I.p` chat_id_
          ]

instance AT.ToJSON RemoveCommunityChat where
  toJSON
    RemoveCommunityChat
      { community_id = community_id_
      , chat_id      = chat_id_
      }
        = A.object
          [ "@type"        A..= AT.String "removeCommunityChat"
          , "community_id" A..= community_id_
          , "chat_id"      A..= chat_id_
          ]

defaultRemoveCommunityChat :: RemoveCommunityChat
defaultRemoveCommunityChat =
  RemoveCommunityChat
    { community_id = Nothing
    , chat_id      = Nothing
    }

