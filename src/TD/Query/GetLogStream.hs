{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetLogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously
data GetLogStream = GetLogStream
  {
  }
  deriving (Eq)

instance Show GetLogStream where
  show GetLogStream =
    "GetLogStream"
      ++ U.cc
        []

instance T.ToJSON GetLogStream where
  toJSON GetLogStream =
    A.object
      [ "@type" A..= T.String "getLogStream"
      ]
