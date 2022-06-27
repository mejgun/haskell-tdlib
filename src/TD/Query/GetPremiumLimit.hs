{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPremiumLimit where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PremiumLimitType as PremiumLimitType
import qualified Utils as U

-- |
-- Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown @limit_type Type of the limit
data GetPremiumLimit = GetPremiumLimit
  { -- |
    limit_type :: Maybe PremiumLimitType.PremiumLimitType
  }
  deriving (Eq)

instance Show GetPremiumLimit where
  show
    GetPremiumLimit
      { limit_type = limit_type_
      } =
      "GetPremiumLimit"
        ++ U.cc
          [ U.p "limit_type" limit_type_
          ]

instance T.ToJSON GetPremiumLimit where
  toJSON
    GetPremiumLimit
      { limit_type = limit_type_
      } =
      A.object
        [ "@type" A..= T.String "getPremiumLimit",
          "limit_type" A..= limit_type_
        ]
