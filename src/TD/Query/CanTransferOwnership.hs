{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CanTransferOwnership where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether the current session can be used to transfer a chat ownership to another user
data CanTransferOwnership = CanTransferOwnership
  {
  }
  deriving (Eq)

instance Show CanTransferOwnership where
  show CanTransferOwnership =
    "CanTransferOwnership"
      ++ U.cc
        []

instance T.ToJSON CanTransferOwnership where
  toJSON CanTransferOwnership =
    A.object
      [ "@type" A..= T.String "canTransferOwnership"
      ]
