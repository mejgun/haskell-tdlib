{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGeneralForumTopicIsHidden where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether a General topic is hidden in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup
data ToggleGeneralForumTopicIsHidden = ToggleGeneralForumTopicIsHidden
  { -- | Pass true to hide and close the General topic; pass false to unhide it
    is_hidden :: Maybe Bool,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGeneralForumTopicIsHidden where
  show
    ToggleGeneralForumTopicIsHidden
      { is_hidden = is_hidden_,
        chat_id = chat_id_
      } =
      "ToggleGeneralForumTopicIsHidden"
        ++ U.cc
          [ U.p "is_hidden" is_hidden_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleGeneralForumTopicIsHidden where
  toJSON
    ToggleGeneralForumTopicIsHidden
      { is_hidden = is_hidden_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGeneralForumTopicIsHidden",
          "is_hidden" A..= is_hidden_,
          "chat_id" A..= chat_id_
        ]
