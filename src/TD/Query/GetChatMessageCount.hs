module TD.Query.GetChatMessageCount(GetChatMessageCount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

data GetChatMessageCount -- ^ Returns approximate number of messages of the specified type in the chat
  = GetChatMessageCount
    { chat_id      :: Maybe Int                                       -- ^ Identifier of the chat in which to count messages
    , _filter      :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content; searchMessagesFilterEmpty is unsupported in this function
    , return_local :: Maybe Bool                                      -- ^ Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally
    }
  deriving (Eq)

instance Show GetChatMessageCount where
  show
    GetChatMessageCount
      { chat_id      = chat_id_
      , _filter      = _filter_
      , return_local = return_local_
      }
        = "GetChatMessageCount"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "_filter"      `I.p` _filter_
          , "return_local" `I.p` return_local_
          ]

instance AT.ToJSON GetChatMessageCount where
  toJSON
    GetChatMessageCount
      { chat_id      = chat_id_
      , _filter      = _filter_
      , return_local = return_local_
      }
        = A.object
          [ "@type"        A..= AT.String "getChatMessageCount"
          , "chat_id"      A..= chat_id_
          , "filter"       A..= _filter_
          , "return_local" A..= return_local_
          ]
