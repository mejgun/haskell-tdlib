{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDefaultMessageAutoDeleteTime where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns default message auto-delete time setting for new chats
data GetDefaultMessageAutoDeleteTime = GetDefaultMessageAutoDeleteTime
  {
  }
  deriving (Eq)

instance Show GetDefaultMessageAutoDeleteTime where
  show GetDefaultMessageAutoDeleteTime =
    "GetDefaultMessageAutoDeleteTime"
      ++ U.cc
        []

instance T.ToJSON GetDefaultMessageAutoDeleteTime where
  toJSON GetDefaultMessageAutoDeleteTime =
    A.object
      [ "@type" A..= T.String "getDefaultMessageAutoDeleteTime"
      ]
