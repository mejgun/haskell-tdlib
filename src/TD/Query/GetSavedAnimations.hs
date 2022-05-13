{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSavedAnimations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns saved animations
data GetSavedAnimations = GetSavedAnimations
  {
  }
  deriving (Eq)

instance Show GetSavedAnimations where
  show GetSavedAnimations =
    "GetSavedAnimations"
      ++ U.cc
        []

instance T.ToJSON GetSavedAnimations where
  toJSON GetSavedAnimations =
    A.object
      [ "@type" A..= T.String "getSavedAnimations"
      ]
