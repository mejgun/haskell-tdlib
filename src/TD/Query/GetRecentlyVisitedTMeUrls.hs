{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetRecentlyVisitedTMeUrls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns t.me URLs recently visited by a newly registered user @referrer Google Play referrer to identify the user
data GetRecentlyVisitedTMeUrls = GetRecentlyVisitedTMeUrls
  { -- |
    referrer :: Maybe String
  }
  deriving (Eq)

instance Show GetRecentlyVisitedTMeUrls where
  show
    GetRecentlyVisitedTMeUrls
      { referrer = referrer
      } =
      "GetRecentlyVisitedTMeUrls"
        ++ U.cc
          [ U.p "referrer" referrer
          ]

instance T.ToJSON GetRecentlyVisitedTMeUrls where
  toJSON
    GetRecentlyVisitedTMeUrls
      { referrer = referrer
      } =
      A.object
        [ "@type" A..= T.String "getRecentlyVisitedTMeUrls",
          "referrer" A..= referrer
        ]
