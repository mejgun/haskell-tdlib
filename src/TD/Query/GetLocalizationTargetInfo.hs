{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetLocalizationTargetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization @only_local Pass true to get only locally available information without sending network requests
data GetLocalizationTargetInfo = GetLocalizationTargetInfo
  { -- |
    only_local :: Maybe Bool
  }
  deriving (Eq)

instance Show GetLocalizationTargetInfo where
  show
    GetLocalizationTargetInfo
      { only_local = only_local_
      } =
      "GetLocalizationTargetInfo"
        ++ U.cc
          [ U.p "only_local" only_local_
          ]

instance T.ToJSON GetLocalizationTargetInfo where
  toJSON
    GetLocalizationTargetInfo
      { only_local = only_local_
      } =
      A.object
        [ "@type" A..= T.String "getLocalizationTargetInfo",
          "only_local" A..= only_local_
        ]
