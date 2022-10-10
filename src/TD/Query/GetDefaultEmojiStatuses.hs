{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDefaultEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns default emoji statuses
data GetDefaultEmojiStatuses = GetDefaultEmojiStatuses
  {
  }
  deriving (Eq)

instance Show GetDefaultEmojiStatuses where
  show GetDefaultEmojiStatuses =
    "GetDefaultEmojiStatuses"
      ++ U.cc
        []

instance T.ToJSON GetDefaultEmojiStatuses where
  toJSON GetDefaultEmojiStatuses =
    A.object
      [ "@type" A..= T.String "getDefaultEmojiStatuses"
      ]
