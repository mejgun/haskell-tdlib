module TD.Query.DeleteChatMessagesByDate
  (DeleteChatMessagesByDate(..)
  , defaultDeleteChatMessagesByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted. Returns 'TD.Data.Ok.Ok'
data DeleteChatMessagesByDate
  = DeleteChatMessagesByDate
    { chat_id  :: Maybe Int  -- ^ Chat identifier
    , min_date :: Maybe Int  -- ^ The minimum date of the messages to delete
    , max_date :: Maybe Int  -- ^ The maximum date of the messages to delete
    , revoke   :: Maybe Bool -- ^ Pass true to delete chat messages for all users; private chats only
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteChatMessagesByDate where
  shortShow
    DeleteChatMessagesByDate
      { chat_id  = chat_id_
      , min_date = min_date_
      , max_date = max_date_
      , revoke   = revoke_
      }
        = "DeleteChatMessagesByDate"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "min_date" `I.p` min_date_
          , "max_date" `I.p` max_date_
          , "revoke"   `I.p` revoke_
          ]

instance AT.ToJSON DeleteChatMessagesByDate where
  toJSON
    DeleteChatMessagesByDate
      { chat_id  = chat_id_
      , min_date = min_date_
      , max_date = max_date_
      , revoke   = revoke_
      }
        = A.object
          [ "@type"    A..= AT.String "deleteChatMessagesByDate"
          , "chat_id"  A..= chat_id_
          , "min_date" A..= min_date_
          , "max_date" A..= max_date_
          , "revoke"   A..= revoke_
          ]

defaultDeleteChatMessagesByDate :: DeleteChatMessagesByDate
defaultDeleteChatMessagesByDate =
  DeleteChatMessagesByDate
    { chat_id  = Nothing
    , min_date = Nothing
    , max_date = Nothing
    , revoke   = Nothing
    }

