{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResetBackgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resets list of installed backgrounds to its default value
data ResetBackgrounds = ResetBackgrounds
  {
  }
  deriving (Eq)

instance Show ResetBackgrounds where
  show ResetBackgrounds =
    "ResetBackgrounds"
      ++ U.cc
        []

instance T.ToJSON ResetBackgrounds where
  toJSON ResetBackgrounds =
    A.object
      [ "@type" A..= T.String "resetBackgrounds"
      ]
