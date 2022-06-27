{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetAllAnimatedEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all emojis, which has a corresponding animated emoji
data GetAllAnimatedEmojis = GetAllAnimatedEmojis
  {
  }
  deriving (Eq)

instance Show GetAllAnimatedEmojis where
  show GetAllAnimatedEmojis =
    "GetAllAnimatedEmojis"
      ++ U.cc
        []

instance T.ToJSON GetAllAnimatedEmojis where
  toJSON GetAllAnimatedEmojis =
    A.object
      [ "@type" A..= T.String "getAllAnimatedEmojis"
      ]
