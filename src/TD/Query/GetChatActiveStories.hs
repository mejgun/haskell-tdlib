{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatActiveStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the list of active stories posted by the given chat @chat_id Chat identifier
data GetChatActiveStories = GetChatActiveStories
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatActiveStories where
  show
    GetChatActiveStories
      { chat_id = chat_id_
      } =
      "GetChatActiveStories"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatActiveStories where
  toJSON
    GetChatActiveStories
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatActiveStories",
          "chat_id" A..= chat_id_
        ]
