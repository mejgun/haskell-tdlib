{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClearAutosaveSettingsExceptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at least one call to getAutosaveSettings
data ClearAutosaveSettingsExceptions = ClearAutosaveSettingsExceptions
  {
  }
  deriving (Eq)

instance Show ClearAutosaveSettingsExceptions where
  show ClearAutosaveSettingsExceptions =
    "ClearAutosaveSettingsExceptions"
      ++ U.cc
        []

instance T.ToJSON ClearAutosaveSettingsExceptions where
  toJSON ClearAutosaveSettingsExceptions =
    A.object
      [ "@type" A..= T.String "clearAutosaveSettingsExceptions"
      ]
