{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClearRecentReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears the list of recently used reactions
data ClearRecentReactions = ClearRecentReactions
  {
  }
  deriving (Eq)

instance Show ClearRecentReactions where
  show ClearRecentReactions =
    "ClearRecentReactions"
      ++ U.cc
        []

instance T.ToJSON ClearRecentReactions where
  toJSON ClearRecentReactions =
    A.object
      [ "@type" A..= T.String "clearRecentReactions"
      ]
