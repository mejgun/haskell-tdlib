{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for a background by its name @name The name of the background
data SearchBackground = SearchBackground
  { -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show SearchBackground where
  show
    SearchBackground
      { name = name_
      } =
      "SearchBackground"
        ++ U.cc
          [ U.p "name" name_
          ]

instance T.ToJSON SearchBackground where
  toJSON
    SearchBackground
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "searchBackground",
          "name" A..= name_
        ]
