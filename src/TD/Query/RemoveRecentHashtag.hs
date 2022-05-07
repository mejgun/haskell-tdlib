{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveRecentHashtag where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a hashtag from the list of recently used hashtags @hashtag Hashtag to delete
data RemoveRecentHashtag = RemoveRecentHashtag
  { -- |
    hashtag :: Maybe String
  }
  deriving (Eq)

instance Show RemoveRecentHashtag where
  show
    RemoveRecentHashtag
      { hashtag = hashtag
      } =
      "RemoveRecentHashtag"
        ++ U.cc
          [ U.p "hashtag" hashtag
          ]

instance T.ToJSON RemoveRecentHashtag where
  toJSON
    RemoveRecentHashtag
      { hashtag = hashtag
      } =
      A.object
        [ "@type" A..= T.String "removeRecentHashtag",
          "hashtag" A..= hashtag
        ]
