{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSupergroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot @supergroup_id Supergroup or channel identifier
data GetSupergroup = GetSupergroup
  { -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetSupergroup where
  show
    GetSupergroup
      { supergroup_id = supergroup_id_
      } =
      "GetSupergroup"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON GetSupergroup where
  toJSON
    GetSupergroup
      { supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "getSupergroup",
          "supergroup_id" A..= supergroup_id_
        ]
