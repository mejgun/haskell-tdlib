module TD.Query.LoadChats
  (LoadChats(..)
  , defaultLoadChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

-- | Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. Returns a 404 error if all chats have been loaded. Returns 'TD.Data.Ok.Ok'
data LoadChats
  = LoadChats
    { chat_list :: Maybe ChatList.ChatList -- ^ The chat list in which to load chats; pass null to load chats from the main chat list
    , limit     :: Maybe Int               -- ^ The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
    }
  deriving (Eq, Show)

instance I.ShortShow LoadChats where
  shortShow
    LoadChats
      { chat_list = chat_list_
      , limit     = limit_
      }
        = "LoadChats"
          ++ I.cc
          [ "chat_list" `I.p` chat_list_
          , "limit"     `I.p` limit_
          ]

instance AT.ToJSON LoadChats where
  toJSON
    LoadChats
      { chat_list = chat_list_
      , limit     = limit_
      }
        = A.object
          [ "@type"     A..= AT.String "loadChats"
          , "chat_list" A..= chat_list_
          , "limit"     A..= limit_
          ]

defaultLoadChats :: LoadChats
defaultLoadChats =
  LoadChats
    { chat_list = Nothing
    , limit     = Nothing
    }

