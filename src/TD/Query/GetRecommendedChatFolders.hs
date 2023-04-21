{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRecommendedChatFolders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns recommended chat folders for the current user
data GetRecommendedChatFolders = GetRecommendedChatFolders
  {
  }
  deriving (Eq)

instance Show GetRecommendedChatFolders where
  show GetRecommendedChatFolders =
    "GetRecommendedChatFolders"
      ++ U.cc
        []

instance T.ToJSON GetRecommendedChatFolders where
  toJSON GetRecommendedChatFolders =
    A.object
      [ "@type" A..= T.String "getRecommendedChatFolders"
      ]
