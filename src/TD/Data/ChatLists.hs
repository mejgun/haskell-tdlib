module TD.Data.ChatLists
  (ChatLists(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

data ChatLists
  = ChatLists -- ^ Contains a list of chat lists
    { chat_lists :: Maybe [ChatList.ChatList] -- ^ List of chat lists
    }
  deriving (Eq, Show)

instance I.ShortShow ChatLists where
  shortShow ChatLists
    { chat_lists = chat_lists_
    }
      = "ChatLists"
        ++ I.cc
        [ "chat_lists" `I.p` chat_lists_
        ]

instance AT.FromJSON ChatLists where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatLists" -> parseChatLists v
      _           -> mempty
    
    where
      parseChatLists :: A.Value -> AT.Parser ChatLists
      parseChatLists = A.withObject "ChatLists" $ \o -> do
        chat_lists_ <- o A..:?  "chat_lists"
        pure $ ChatLists
          { chat_lists = chat_lists_
          }
  parseJSON _ = mempty

