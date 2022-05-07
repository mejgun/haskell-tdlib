{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchHashtags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for recently used hashtags by their prefix @prefix Hashtag prefix to search for @limit The maximum number of hashtags to be returned
data SearchHashtags = SearchHashtags
  { -- |
    limit :: Maybe Int,
    -- |
    prefix :: Maybe String
  }
  deriving (Eq)

instance Show SearchHashtags where
  show
    SearchHashtags
      { limit = limit,
        prefix = prefix
      } =
      "SearchHashtags"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "prefix" prefix
          ]

instance T.ToJSON SearchHashtags where
  toJSON
    SearchHashtags
      { limit = limit,
        prefix = prefix
      } =
      A.object
        [ "@type" A..= T.String "searchHashtags",
          "limit" A..= limit,
          "prefix" A..= prefix
        ]
