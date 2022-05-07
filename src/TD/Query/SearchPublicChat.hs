{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchPublicChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches a public chat by its username. Currently, only private chats, supergroups and channels can be public. Returns the chat if found; otherwise an error is returned @username Username to be resolved
data SearchPublicChat = SearchPublicChat
  { -- |
    username :: Maybe String
  }
  deriving (Eq)

instance Show SearchPublicChat where
  show
    SearchPublicChat
      { username = username
      } =
      "SearchPublicChat"
        ++ U.cc
          [ U.p "username" username
          ]

instance T.ToJSON SearchPublicChat where
  toJSON
    SearchPublicChat
      { username = username
      } =
      A.object
        [ "@type" A..= T.String "searchPublicChat",
          "username" A..= username
        ]
