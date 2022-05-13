{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSupportUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a user that can be contacted to get support
data GetSupportUser = GetSupportUser
  {
  }
  deriving (Eq)

instance Show GetSupportUser where
  show GetSupportUser =
    "GetSupportUser"
      ++ U.cc
        []

instance T.ToJSON GetSupportUser where
  toJSON GetSupportUser =
    A.object
      [ "@type" A..= T.String "getSupportUser"
      ]
