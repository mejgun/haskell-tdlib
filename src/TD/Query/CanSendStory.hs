{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CanSendStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether the current user can send a story on behalf of a chat; requires can_post_stories rights for channel chats @chat_id Chat identifier
data CanSendStory = CanSendStory
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CanSendStory where
  show
    CanSendStory
      { chat_id = chat_id_
      } =
      "CanSendStory"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON CanSendStory where
  toJSON
    CanSendStory
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "canSendStory",
          "chat_id" A..= chat_id_
        ]
