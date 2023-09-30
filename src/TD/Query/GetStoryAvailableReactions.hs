{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStoryAvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns reactions, which can be chosen for a story @row_size Number of reaction per row, 5-25
data GetStoryAvailableReactions = GetStoryAvailableReactions
  { -- |
    row_size :: Maybe Int
  }
  deriving (Eq)

instance Show GetStoryAvailableReactions where
  show
    GetStoryAvailableReactions
      { row_size = row_size_
      } =
      "GetStoryAvailableReactions"
        ++ U.cc
          [ U.p "row_size" row_size_
          ]

instance T.ToJSON GetStoryAvailableReactions where
  toJSON
    GetStoryAvailableReactions
      { row_size = row_size_
      } =
      A.object
        [ "@type" A..= T.String "getStoryAvailableReactions",
          "row_size" A..= row_size_
        ]
