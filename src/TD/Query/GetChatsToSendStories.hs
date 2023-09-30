{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatsToSendStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns channel chats in which the current user has the right to post stories. The chats must be rechecked with canSendStory before actually trying to post a story there
data GetChatsToSendStories = GetChatsToSendStories
  {
  }
  deriving (Eq)

instance Show GetChatsToSendStories where
  show GetChatsToSendStories =
    "GetChatsToSendStories"
      ++ U.cc
        []

instance T.ToJSON GetChatsToSendStories where
  toJSON GetChatsToSendStories =
    A.object
      [ "@type" A..= T.String "getChatsToSendStories"
      ]
