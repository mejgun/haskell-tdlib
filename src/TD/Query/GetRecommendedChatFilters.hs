{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRecommendedChatFilters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns recommended chat filters for the current user
data GetRecommendedChatFilters = GetRecommendedChatFilters
  {
  }
  deriving (Eq)

instance Show GetRecommendedChatFilters where
  show GetRecommendedChatFilters =
    "GetRecommendedChatFilters"
      ++ U.cc
        []

instance T.ToJSON GetRecommendedChatFilters where
  toJSON GetRecommendedChatFilters =
    A.object
      [ "@type" A..= T.String "getRecommendedChatFilters"
      ]
