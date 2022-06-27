{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPremiumFeatures where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PremiumSource as PremiumSource
import qualified Utils as U

-- |
-- Returns information about features, available to Premium users @source Source of the request; pass null if the method is called from some non-standard source
data GetPremiumFeatures = GetPremiumFeatures
  { -- |
    source :: Maybe PremiumSource.PremiumSource
  }
  deriving (Eq)

instance Show GetPremiumFeatures where
  show
    GetPremiumFeatures
      { source = source_
      } =
      "GetPremiumFeatures"
        ++ U.cc
          [ U.p "source" source_
          ]

instance T.ToJSON GetPremiumFeatures where
  toJSON
    GetPremiumFeatures
      { source = source_
      } =
      A.object
        [ "@type" A..= T.String "getPremiumFeatures",
          "source" A..= source_
        ]
