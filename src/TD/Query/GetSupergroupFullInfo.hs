{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSupergroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute @supergroup_id Supergroup or channel identifier
data GetSupergroupFullInfo = GetSupergroupFullInfo
  { -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetSupergroupFullInfo where
  show
    GetSupergroupFullInfo
      { supergroup_id = supergroup_id_
      } =
      "GetSupergroupFullInfo"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON GetSupergroupFullInfo where
  toJSON
    GetSupergroupFullInfo
      { supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "getSupergroupFullInfo",
          "supergroup_id" A..= supergroup_id_
        ]
