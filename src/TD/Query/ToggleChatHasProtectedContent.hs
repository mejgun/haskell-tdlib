{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleChatHasProtectedContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the ability of users to save, forward, or copy chat content. Supported only for basic groups, supergroups and channels. Requires owner privileges
data ToggleChatHasProtectedContent = ToggleChatHasProtectedContent
  { -- |
    has_protected_content :: Maybe Bool,
    -- | Chat identifier @has_protected_content New value of has_protected_content
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleChatHasProtectedContent where
  show
    ToggleChatHasProtectedContent
      { has_protected_content = has_protected_content_,
        chat_id = chat_id_
      } =
      "ToggleChatHasProtectedContent"
        ++ U.cc
          [ U.p "has_protected_content" has_protected_content_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleChatHasProtectedContent where
  toJSON
    ToggleChatHasProtectedContent
      { has_protected_content = has_protected_content_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleChatHasProtectedContent",
          "has_protected_content" A..= has_protected_content_,
          "chat_id" A..= chat_id_
        ]
