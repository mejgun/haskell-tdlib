module TD.Data.ChatsNearby
  (ChatsNearby(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatNearby as ChatNearby

data ChatsNearby
  = ChatsNearby -- ^ Represents a list of chats located nearby
    { users_nearby       :: Maybe [ChatNearby.ChatNearby] -- ^ List of users nearby
    , supergroups_nearby :: Maybe [ChatNearby.ChatNearby] -- ^ List of location-based supergroups nearby
    }
  deriving (Eq, Show)

instance I.ShortShow ChatsNearby where
  shortShow ChatsNearby
    { users_nearby       = users_nearby_
    , supergroups_nearby = supergroups_nearby_
    }
      = "ChatsNearby"
        ++ I.cc
        [ "users_nearby"       `I.p` users_nearby_
        , "supergroups_nearby" `I.p` supergroups_nearby_
        ]

instance AT.FromJSON ChatsNearby where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatsNearby" -> parseChatsNearby v
      _             -> mempty
    
    where
      parseChatsNearby :: A.Value -> AT.Parser ChatsNearby
      parseChatsNearby = A.withObject "ChatsNearby" $ \o -> do
        users_nearby_       <- o A..:?  "users_nearby"
        supergroups_nearby_ <- o A..:?  "supergroups_nearby"
        pure $ ChatsNearby
          { users_nearby       = users_nearby_
          , supergroups_nearby = supergroups_nearby_
          }
  parseJSON _ = mempty

