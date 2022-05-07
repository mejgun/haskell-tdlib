{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetSavedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns saved order information. Returns a 404 error if there is no saved order information
data GetSavedOrderInfo = GetSavedOrderInfo
  {
  }
  deriving (Eq)

instance Show GetSavedOrderInfo where
  show GetSavedOrderInfo =
    "GetSavedOrderInfo"
      ++ U.cc
        []

instance T.ToJSON GetSavedOrderInfo where
  toJSON GetSavedOrderInfo =
    A.object
      [ "@type" A..= T.String "getSavedOrderInfo"
      ]
