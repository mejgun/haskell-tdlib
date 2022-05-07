{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatMessageCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Returns approximate number of messages of the specified type in the chat @chat_id Identifier of the chat in which to count messages @filter Filter for message content; searchMessagesFilterEmpty is unsupported in this function @return_local Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally
data GetChatMessageCount = GetChatMessageCount
  { -- |
    return_local :: Maybe Bool,
    -- |
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatMessageCount where
  show
    GetChatMessageCount
      { return_local = return_local,
        _filter = _filter,
        chat_id = chat_id
      } =
      "GetChatMessageCount"
        ++ U.cc
          [ U.p "return_local" return_local,
            U.p "_filter" _filter,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatMessageCount where
  toJSON
    GetChatMessageCount
      { return_local = return_local,
        _filter = _filter,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatMessageCount",
          "return_local" A..= return_local,
          "filter" A..= _filter,
          "chat_id" A..= chat_id
        ]
