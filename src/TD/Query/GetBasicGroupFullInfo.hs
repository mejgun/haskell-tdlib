{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBasicGroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns full information about a basic group by its identifier @basic_group_id Basic group identifier
data GetBasicGroupFullInfo = GetBasicGroupFullInfo
  { -- |
    basic_group_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetBasicGroupFullInfo where
  show
    GetBasicGroupFullInfo
      { basic_group_id = basic_group_id_
      } =
      "GetBasicGroupFullInfo"
        ++ U.cc
          [ U.p "basic_group_id" basic_group_id_
          ]

instance T.ToJSON GetBasicGroupFullInfo where
  toJSON
    GetBasicGroupFullInfo
      { basic_group_id = basic_group_id_
      } =
      A.object
        [ "@type" A..= T.String "getBasicGroupFullInfo",
          "basic_group_id" A..= basic_group_id_
        ]
