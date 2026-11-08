module TD.Data.CommunityAddChatRequest
  (CommunityAddChatRequest(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CommunityAddChatRequest
  = CommunityAddChatRequest -- ^ Describes a request to add a chat to a community
    { chat_id        :: Maybe Int  -- ^ Identifier of the chat to be added
    , is_hidden      :: Maybe Bool -- ^ True, if the chat will be visible only to administrators of the community
    , sender_user_id :: Maybe Int  -- ^ Identifier of the user who sent the request
    , date           :: Maybe Int  -- ^ Point in time (Unix timestamp) when the request was sent
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityAddChatRequest where
  shortShow CommunityAddChatRequest
    { chat_id        = chat_id_
    , is_hidden      = is_hidden_
    , sender_user_id = sender_user_id_
    , date           = date_
    }
      = "CommunityAddChatRequest"
        ++ I.cc
        [ "chat_id"        `I.p` chat_id_
        , "is_hidden"      `I.p` is_hidden_
        , "sender_user_id" `I.p` sender_user_id_
        , "date"           `I.p` date_
        ]

instance AT.FromJSON CommunityAddChatRequest where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityAddChatRequest" -> parseCommunityAddChatRequest v
      _                         -> mempty
    
    where
      parseCommunityAddChatRequest :: A.Value -> AT.Parser CommunityAddChatRequest
      parseCommunityAddChatRequest = A.withObject "CommunityAddChatRequest" $ \o -> do
        chat_id_        <- o A..:?  "chat_id"
        is_hidden_      <- o A..:?  "is_hidden"
        sender_user_id_ <- o A..:?  "sender_user_id"
        date_           <- o A..:?  "date"
        pure $ CommunityAddChatRequest
          { chat_id        = chat_id_
          , is_hidden      = is_hidden_
          , sender_user_id = sender_user_id_
          , date           = date_
          }
  parseJSON _ = mempty

