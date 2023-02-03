{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetAutosaveSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns autosave settings for the current user
data GetAutosaveSettings = GetAutosaveSettings
  {
  }
  deriving (Eq)

instance Show GetAutosaveSettings where
  show GetAutosaveSettings =
    "GetAutosaveSettings"
      ++ U.cc
        []

instance T.ToJSON GetAutosaveSettings where
  toJSON GetAutosaveSettings =
    A.object
      [ "@type" A..= T.String "getAutosaveSettings"
      ]
