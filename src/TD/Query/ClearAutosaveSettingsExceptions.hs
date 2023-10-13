module TD.Query.ClearAutosaveSettingsExceptions
  (ClearAutosaveSettingsExceptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ClearAutosaveSettingsExceptions -- ^ Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at least one call to getAutosaveSettings
  = ClearAutosaveSettingsExceptions
  deriving (Eq)

instance Show ClearAutosaveSettingsExceptions where
  show
    ClearAutosaveSettingsExceptions
        = "ClearAutosaveSettingsExceptions"

instance AT.ToJSON ClearAutosaveSettingsExceptions where
  toJSON
    ClearAutosaveSettingsExceptions
        = A.object
          [ "@type" A..= AT.String "clearAutosaveSettingsExceptions"
          ]

