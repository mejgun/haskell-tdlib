{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ClearRecentlyFoundChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears the list of recently found chats
data ClearRecentlyFoundChats = ClearRecentlyFoundChats
  {
  }
  deriving (Eq)

instance Show ClearRecentlyFoundChats where
  show ClearRecentlyFoundChats =
    "ClearRecentlyFoundChats"
      ++ U.cc
        []

instance T.ToJSON ClearRecentlyFoundChats where
  toJSON ClearRecentlyFoundChats =
    A.object
      [ "@type" A..= T.String "clearRecentlyFoundChats"
      ]
