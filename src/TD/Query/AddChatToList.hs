module TD.Query.AddChatToList
  (AddChatToList(..)
  , defaultAddChatToList
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

-- | Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed. Returns 'TD.Data.Ok.Ok'
data AddChatToList
  = AddChatToList
    { chat_id   :: Maybe Int               -- ^ Chat identifier
    , chat_list :: Maybe ChatList.ChatList -- ^ The chat list. Use getChatListsToAddChat to get suitable chat lists
    }
  deriving (Eq, Show)

instance I.ShortShow AddChatToList where
  shortShow
    AddChatToList
      { chat_id   = chat_id_
      , chat_list = chat_list_
      }
        = "AddChatToList"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "chat_list" `I.p` chat_list_
          ]

instance AT.ToJSON AddChatToList where
  toJSON
    AddChatToList
      { chat_id   = chat_id_
      , chat_list = chat_list_
      }
        = A.object
          [ "@type"     A..= AT.String "addChatToList"
          , "chat_id"   A..= chat_id_
          , "chat_list" A..= chat_list_
          ]

defaultAddChatToList :: AddChatToList
defaultAddChatToList =
  AddChatToList
    { chat_id   = Nothing
    , chat_list = Nothing
    }

