{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetCountries where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about existing countries. Can be called before authorization
data GetCountries = GetCountries
  {
  }
  deriving (Eq)

instance Show GetCountries where
  show GetCountries =
    "GetCountries"
      ++ U.cc
        []

instance T.ToJSON GetCountries where
  toJSON GetCountries =
    A.object
      [ "@type" A..= T.String "getCountries"
      ]
