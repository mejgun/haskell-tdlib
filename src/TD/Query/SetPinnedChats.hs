module TD.Query.SetPinnedChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

data SetPinnedChats -- ^ Changes the order of pinned chats
  = SetPinnedChats
    { chat_list :: Maybe ChatList.ChatList -- ^ Chat list in which to change the order of pinned chats
    , chat_ids  :: Maybe [Int]             -- ^ The new list of pinned chats
    }
  deriving (Eq)

instance Show SetPinnedChats where
  show
    SetPinnedChats
      { chat_list = chat_list_
      , chat_ids  = chat_ids_
      }
        = "SetPinnedChats"
          ++ I.cc
          [ "chat_list" `I.p` chat_list_
          , "chat_ids"  `I.p` chat_ids_
          ]

instance AT.ToJSON SetPinnedChats where
  toJSON
    SetPinnedChats
      { chat_list = chat_list_
      , chat_ids  = chat_ids_
      }
        = A.object
          [ "@type"     A..= AT.String "setPinnedChats"
          , "chat_list" A..= chat_list_
          , "chat_ids"  A..= chat_ids_
          ]
