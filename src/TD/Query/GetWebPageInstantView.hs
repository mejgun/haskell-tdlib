{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetWebPageInstantView where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page @url The web page URL @force_full Pass true to get full instant view for the web page
data GetWebPageInstantView = GetWebPageInstantView
  { -- |
    force_full :: Maybe Bool,
    -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show GetWebPageInstantView where
  show
    GetWebPageInstantView
      { force_full = force_full,
        url = url
      } =
      "GetWebPageInstantView"
        ++ U.cc
          [ U.p "force_full" force_full,
            U.p "url" url
          ]

instance T.ToJSON GetWebPageInstantView where
  toJSON
    GetWebPageInstantView
      { force_full = force_full,
        url = url
      } =
      A.object
        [ "@type" A..= T.String "getWebPageInstantView",
          "force_full" A..= force_full,
          "url" A..= url
        ]
