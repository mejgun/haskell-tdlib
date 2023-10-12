module TD.Data.ChatPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList
import qualified TD.Data.ChatSource as ChatSource

data ChatPosition
  = ChatPosition -- ^ Describes a position of a chat in a chat list
    { list      :: Maybe ChatList.ChatList     -- ^ The chat list
    , order     :: Maybe Int                   -- ^ A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
    , is_pinned :: Maybe Bool                  -- ^ True, if the chat is pinned in the chat list
    , source    :: Maybe ChatSource.ChatSource -- ^ Source of the chat in the chat list; may be null
    }
  deriving (Eq)

instance Show ChatPosition where
  show ChatPosition
    { list      = list_
    , order     = order_
    , is_pinned = is_pinned_
    , source    = source_
    }
      = "ChatPosition"
        ++ I.cc
        [ "list"      `I.p` list_
        , "order"     `I.p` order_
        , "is_pinned" `I.p` is_pinned_
        , "source"    `I.p` source_
        ]

instance AT.FromJSON ChatPosition where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPosition" -> parseChatPosition v
      _              -> mempty
    
    where
      parseChatPosition :: A.Value -> AT.Parser ChatPosition
      parseChatPosition = A.withObject "ChatPosition" $ \o -> do
        list_      <- o A..:?                       "list"
        order_     <- fmap I.readInt64 <$> o A..:?  "order"
        is_pinned_ <- o A..:?                       "is_pinned"
        source_    <- o A..:?                       "source"
        pure $ ChatPosition
          { list      = list_
          , order     = order_
          , is_pinned = is_pinned_
          , source    = source_
          }

instance AT.ToJSON ChatPosition where
  toJSON ChatPosition
    { list      = list_
    , order     = order_
    , is_pinned = is_pinned_
    , source    = source_
    }
      = A.object
        [ "@type"     A..= AT.String "chatPosition"
        , "list"      A..= list_
        , "order"     A..= fmap I.writeInt64  order_
        , "is_pinned" A..= is_pinned_
        , "source"    A..= source_
        ]
