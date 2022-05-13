{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRecentInlineBots where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns up to 20 recently used inline bots in the order of their last usage
data GetRecentInlineBots = GetRecentInlineBots
  {
  }
  deriving (Eq)

instance Show GetRecentInlineBots where
  show GetRecentInlineBots =
    "GetRecentInlineBots"
      ++ U.cc
        []

instance T.ToJSON GetRecentInlineBots where
  toJSON GetRecentInlineBots =
    A.object
      [ "@type" A..= T.String "getRecentInlineBots"
      ]
