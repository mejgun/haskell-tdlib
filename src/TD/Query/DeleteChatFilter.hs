{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes existing chat filter @chat_filter_id Chat filter identifier
data DeleteChatFilter = DeleteChatFilter
  { -- |
    chat_filter_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatFilter where
  show
    DeleteChatFilter
      { chat_filter_id = chat_filter_id_
      } =
      "DeleteChatFilter"
        ++ U.cc
          [ U.p "chat_filter_id" chat_filter_id_
          ]

instance T.ToJSON DeleteChatFilter where
  toJSON
    DeleteChatFilter
      { chat_filter_id = chat_filter_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteChatFilter",
          "chat_filter_id" A..= chat_filter_id_
        ]
