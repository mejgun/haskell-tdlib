{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified TD.Data.ChatSource as ChatSource
import qualified Utils as U

-- |
data ChatPosition = -- | Describes a position of a chat in a chat list
  ChatPosition
  { -- | Source of the chat in the chat list; may be null
    source :: Maybe ChatSource.ChatSource,
    -- | True, if the chat is pinned in the chat list
    is_pinned :: Maybe Bool,
    -- | A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
    order :: Maybe Int,
    -- | The chat list
    list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show ChatPosition where
  show
    ChatPosition
      { source = source_,
        is_pinned = is_pinned_,
        order = order_,
        list = list_
      } =
      "ChatPosition"
        ++ U.cc
          [ U.p "source" source_,
            U.p "is_pinned" is_pinned_,
            U.p "order" order_,
            U.p "list" list_
          ]

instance T.FromJSON ChatPosition where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPosition" -> parseChatPosition v
      _ -> mempty
    where
      parseChatPosition :: A.Value -> T.Parser ChatPosition
      parseChatPosition = A.withObject "ChatPosition" $ \o -> do
        source_ <- o A..:? "source"
        is_pinned_ <- o A..:? "is_pinned"
        order_ <- mconcat [o A..:? "order", U.rm <$> (o A..: "order" :: T.Parser String)] :: T.Parser (Maybe Int)
        list_ <- o A..:? "list"
        return $ ChatPosition {source = source_, is_pinned = is_pinned_, order = order_, list = list_}
  parseJSON _ = mempty

instance T.ToJSON ChatPosition where
  toJSON
    ChatPosition
      { source = source_,
        is_pinned = is_pinned_,
        order = order_,
        list = list_
      } =
      A.object
        [ "@type" A..= T.String "chatPosition",
          "source" A..= source_,
          "is_pinned" A..= is_pinned_,
          "order" A..= order_,
          "list" A..= list_
        ]
