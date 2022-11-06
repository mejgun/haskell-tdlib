{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetForumTopicDefaultIcons where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of custom emojis, which can be used as forum topic icon by all users
data GetForumTopicDefaultIcons = GetForumTopicDefaultIcons
  {
  }
  deriving (Eq)

instance Show GetForumTopicDefaultIcons where
  show GetForumTopicDefaultIcons =
    "GetForumTopicDefaultIcons"
      ++ U.cc
        []

instance T.ToJSON GetForumTopicDefaultIcons where
  toJSON GetForumTopicDefaultIcons =
    A.object
      [ "@type" A..= T.String "getForumTopicDefaultIcons"
      ]
