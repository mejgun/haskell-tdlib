module TD.Data.ChatType
  (ChatType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the type of chat
data ChatType
  = ChatTypePrivate -- ^ An ordinary chat with a user
    { user_id :: Maybe Int -- ^ User identifier
    }
  | ChatTypeBasicGroup -- ^ A basic group (a chat with 0-200 other users)
    { basic_group_id :: Maybe Int -- ^ Basic group identifier
    }
  | ChatTypeSupergroup -- ^ A supergroup or channel (with unlimited members)
    { supergroup_id :: Maybe Int  -- ^ Supergroup or channel identifier
    , is_channel    :: Maybe Bool -- ^ True, if the supergroup is a channel
    }
  | ChatTypeSecret -- ^ A secret chat with a user
    { secret_chat_id :: Maybe Int -- ^ Secret chat identifier
    , user_id        :: Maybe Int -- ^ User identifier of the other user in the secret chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatType where
  shortShow ChatTypePrivate
    { user_id = user_id_
    }
      = "ChatTypePrivate"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow ChatTypeBasicGroup
    { basic_group_id = basic_group_id_
    }
      = "ChatTypeBasicGroup"
        ++ I.cc
        [ "basic_group_id" `I.p` basic_group_id_
        ]
  shortShow ChatTypeSupergroup
    { supergroup_id = supergroup_id_
    , is_channel    = is_channel_
    }
      = "ChatTypeSupergroup"
        ++ I.cc
        [ "supergroup_id" `I.p` supergroup_id_
        , "is_channel"    `I.p` is_channel_
        ]
  shortShow ChatTypeSecret
    { secret_chat_id = secret_chat_id_
    , user_id        = user_id_
    }
      = "ChatTypeSecret"
        ++ I.cc
        [ "secret_chat_id" `I.p` secret_chat_id_
        , "user_id"        `I.p` user_id_
        ]

instance AT.FromJSON ChatType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatTypePrivate"    -> parseChatTypePrivate v
      "chatTypeBasicGroup" -> parseChatTypeBasicGroup v
      "chatTypeSupergroup" -> parseChatTypeSupergroup v
      "chatTypeSecret"     -> parseChatTypeSecret v
      _                    -> mempty
    
    where
      parseChatTypePrivate :: A.Value -> AT.Parser ChatType
      parseChatTypePrivate = A.withObject "ChatTypePrivate" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ ChatTypePrivate
          { user_id = user_id_
          }
      parseChatTypeBasicGroup :: A.Value -> AT.Parser ChatType
      parseChatTypeBasicGroup = A.withObject "ChatTypeBasicGroup" $ \o -> do
        basic_group_id_ <- o A..:?  "basic_group_id"
        pure $ ChatTypeBasicGroup
          { basic_group_id = basic_group_id_
          }
      parseChatTypeSupergroup :: A.Value -> AT.Parser ChatType
      parseChatTypeSupergroup = A.withObject "ChatTypeSupergroup" $ \o -> do
        supergroup_id_ <- o A..:?  "supergroup_id"
        is_channel_    <- o A..:?  "is_channel"
        pure $ ChatTypeSupergroup
          { supergroup_id = supergroup_id_
          , is_channel    = is_channel_
          }
      parseChatTypeSecret :: A.Value -> AT.Parser ChatType
      parseChatTypeSecret = A.withObject "ChatTypeSecret" $ \o -> do
        secret_chat_id_ <- o A..:?  "secret_chat_id"
        user_id_        <- o A..:?  "user_id"
        pure $ ChatTypeSecret
          { secret_chat_id = secret_chat_id_
          , user_id        = user_id_
          }
  parseJSON _ = mempty

