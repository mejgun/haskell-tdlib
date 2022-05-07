{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetBasicGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot @basic_group_id Basic group identifier
data GetBasicGroup = GetBasicGroup
  { -- |
    basic_group_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetBasicGroup where
  show
    GetBasicGroup
      { basic_group_id = basic_group_id
      } =
      "GetBasicGroup"
        ++ U.cc
          [ U.p "basic_group_id" basic_group_id
          ]

instance T.ToJSON GetBasicGroup where
  toJSON
    GetBasicGroup
      { basic_group_id = basic_group_id
      } =
      A.object
        [ "@type" A..= T.String "getBasicGroup",
          "basic_group_id" A..= basic_group_id
        ]
