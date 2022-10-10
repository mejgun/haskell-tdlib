{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRecentEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns recent emoji statuses
data GetRecentEmojiStatuses = GetRecentEmojiStatuses
  {
  }
  deriving (Eq)

instance Show GetRecentEmojiStatuses where
  show GetRecentEmojiStatuses =
    "GetRecentEmojiStatuses"
      ++ U.cc
        []

instance T.ToJSON GetRecentEmojiStatuses where
  toJSON GetRecentEmojiStatuses =
    A.object
      [ "@type" A..= T.String "getRecentEmojiStatuses"
      ]
