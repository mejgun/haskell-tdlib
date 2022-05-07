{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ClearAllDraftMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears message drafts in all chats @exclude_secret_chats Pass true to keep local message drafts in secret chats
data ClearAllDraftMessages = ClearAllDraftMessages
  { -- |
    exclude_secret_chats :: Maybe Bool
  }
  deriving (Eq)

instance Show ClearAllDraftMessages where
  show
    ClearAllDraftMessages
      { exclude_secret_chats = exclude_secret_chats
      } =
      "ClearAllDraftMessages"
        ++ U.cc
          [ U.p "exclude_secret_chats" exclude_secret_chats
          ]

instance T.ToJSON ClearAllDraftMessages where
  toJSON
    ClearAllDraftMessages
      { exclude_secret_chats = exclude_secret_chats
      } =
      A.object
        [ "@type" A..= T.String "clearAllDraftMessages",
          "exclude_secret_chats" A..= exclude_secret_chats
        ]
