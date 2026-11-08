module TD.Data.CommunityMemberChats
  (CommunityMemberChats(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CommunityMemberChats
  = CommunityMemberChats -- ^ Contains information about chats in a community, which are joined or owned by a member of the community
    { owned_chat_ids  :: Maybe [Int] -- ^ Identifiers of the chats owned by the member. The chats will be removed from the community if the member is banned in the community
    , joined_chat_ids :: Maybe [Int] -- ^ Identifiers of the non-owned chats joined by the member
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityMemberChats where
  shortShow CommunityMemberChats
    { owned_chat_ids  = owned_chat_ids_
    , joined_chat_ids = joined_chat_ids_
    }
      = "CommunityMemberChats"
        ++ I.cc
        [ "owned_chat_ids"  `I.p` owned_chat_ids_
        , "joined_chat_ids" `I.p` joined_chat_ids_
        ]

instance AT.FromJSON CommunityMemberChats where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityMemberChats" -> parseCommunityMemberChats v
      _                      -> mempty
    
    where
      parseCommunityMemberChats :: A.Value -> AT.Parser CommunityMemberChats
      parseCommunityMemberChats = A.withObject "CommunityMemberChats" $ \o -> do
        owned_chat_ids_  <- o A..:?  "owned_chat_ids"
        joined_chat_ids_ <- o A..:?  "joined_chat_ids"
        pure $ CommunityMemberChats
          { owned_chat_ids  = owned_chat_ids_
          , joined_chat_ids = joined_chat_ids_
          }
  parseJSON _ = mempty

