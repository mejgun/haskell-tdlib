{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetThemedEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns up to 8 themed emoji statuses, which color must be changed to the color of the Telegram Premium badge
data GetThemedEmojiStatuses = GetThemedEmojiStatuses
  {
  }
  deriving (Eq)

instance Show GetThemedEmojiStatuses where
  show GetThemedEmojiStatuses =
    "GetThemedEmojiStatuses"
      ++ U.cc
        []

instance T.ToJSON GetThemedEmojiStatuses where
  toJSON GetThemedEmojiStatuses =
    A.object
      [ "@type" A..= T.String "getThemedEmojiStatuses"
      ]
