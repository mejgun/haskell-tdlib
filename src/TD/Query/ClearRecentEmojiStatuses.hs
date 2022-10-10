{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClearRecentEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears the list of recently used emoji statuses
data ClearRecentEmojiStatuses = ClearRecentEmojiStatuses
  {
  }
  deriving (Eq)

instance Show ClearRecentEmojiStatuses where
  show ClearRecentEmojiStatuses =
    "ClearRecentEmojiStatuses"
      ++ U.cc
        []

instance T.ToJSON ClearRecentEmojiStatuses where
  toJSON ClearRecentEmojiStatuses =
    A.object
      [ "@type" A..= T.String "clearRecentEmojiStatuses"
      ]
