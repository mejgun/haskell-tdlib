module TD.Query.GetChatMessageByDate
  (GetChatMessageByDate(..)
  , defaultGetChatMessageByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the last message sent in a chat no later than the specified date. Returns a 404 error if such message doesn't exist. Returns 'TD.Data.Message.Message'
data GetChatMessageByDate
  = GetChatMessageByDate
    { chat_id :: Maybe Int -- ^ Chat identifier
    , date    :: Maybe Int -- ^ Point in time (Unix timestamp) relative to which to search for messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatMessageByDate where
  shortShow
    GetChatMessageByDate
      { chat_id = chat_id_
      , date    = date_
      }
        = "GetChatMessageByDate"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "date"    `I.p` date_
          ]

instance AT.ToJSON GetChatMessageByDate where
  toJSON
    GetChatMessageByDate
      { chat_id = chat_id_
      , date    = date_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatMessageByDate"
          , "chat_id" A..= chat_id_
          , "date"    A..= date_
          ]

defaultGetChatMessageByDate :: GetChatMessageByDate
defaultGetChatMessageByDate =
  GetChatMessageByDate
    { chat_id = Nothing
    , date    = Nothing
    }

