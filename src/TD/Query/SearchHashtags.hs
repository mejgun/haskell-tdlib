{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { limit = limit_,
        prefix = prefix_
      } =
      "SearchHashtags"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "prefix" prefix_
          ]

instance T.ToJSON SearchHashtags where
  toJSON
    SearchHashtags
      { limit = limit_,
        prefix = prefix_
      } =
      A.object
        [ "@type" A..= T.String "searchHashtags",
          "limit" A..= limit_,
          "prefix" A..= prefix_
        ]
