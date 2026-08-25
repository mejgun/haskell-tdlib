module TD.Data.CommunityChat
  (CommunityChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CommunityChat
  = CommunityChat -- ^ Describes a chat in a community
    { chat_id          :: Maybe Int  -- ^ Identifier of the chat in the community
    , can_view_history :: Maybe Bool -- ^ True, if message history of the chat can be viewed
    , is_hidden        :: Maybe Bool -- ^ True, if the chat is hidden in the list of community chats; for community administrators only
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityChat where
  shortShow CommunityChat
    { chat_id          = chat_id_
    , can_view_history = can_view_history_
    , is_hidden        = is_hidden_
    }
      = "CommunityChat"
        ++ I.cc
        [ "chat_id"          `I.p` chat_id_
        , "can_view_history" `I.p` can_view_history_
        , "is_hidden"        `I.p` is_hidden_
        ]

instance AT.FromJSON CommunityChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityChat" -> parseCommunityChat v
      _               -> mempty
    
    where
      parseCommunityChat :: A.Value -> AT.Parser CommunityChat
      parseCommunityChat = A.withObject "CommunityChat" $ \o -> do
        chat_id_          <- o A..:?  "chat_id"
        can_view_history_ <- o A..:?  "can_view_history"
        is_hidden_        <- o A..:?  "is_hidden"
        pure $ CommunityChat
          { chat_id          = chat_id_
          , can_view_history = can_view_history_
          , is_hidden        = is_hidden_
          }
  parseJSON _ = mempty

