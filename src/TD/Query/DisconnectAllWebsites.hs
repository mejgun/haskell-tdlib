{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DisconnectAllWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Disconnects all websites from the current user's Telegram account
data DisconnectAllWebsites = DisconnectAllWebsites
  {
  }
  deriving (Eq)

instance Show DisconnectAllWebsites where
  show DisconnectAllWebsites =
    "DisconnectAllWebsites"
      ++ U.cc
        []

instance T.ToJSON DisconnectAllWebsites where
  toJSON DisconnectAllWebsites =
    A.object
      [ "@type" A..= T.String "disconnectAllWebsites"
      ]
