module TD.Query.GetChats
  (GetChats(..)
  , defaultGetChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

-- | Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state. Returns 'TD.Data.Chats.Chats'
data GetChats
  = GetChats
    { chat_list :: Maybe ChatList.ChatList -- ^ The chat list in which to return chats; pass null to get chats from the main chat list
    , limit     :: Maybe Int               -- ^ The maximum number of chats to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetChats where
  shortShow
    GetChats
      { chat_list = chat_list_
      , limit     = limit_
      }
        = "GetChats"
          ++ I.cc
          [ "chat_list" `I.p` chat_list_
          , "limit"     `I.p` limit_
          ]

instance AT.ToJSON GetChats where
  toJSON
    GetChats
      { chat_list = chat_list_
      , limit     = limit_
      }
        = A.object
          [ "@type"     A..= AT.String "getChats"
          , "chat_list" A..= chat_list_
          , "limit"     A..= limit_
          ]

defaultGetChats :: GetChats
defaultGetChats =
  GetChats
    { chat_list = Nothing
    , limit     = Nothing
    }

