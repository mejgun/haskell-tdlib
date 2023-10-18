module TD.Query.ClearAutosaveSettingsExceptions
  (ClearAutosaveSettingsExceptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at least one call to getAutosaveSettings. Returns 'TD.Data.Ok.Ok'
data ClearAutosaveSettingsExceptions
  = ClearAutosaveSettingsExceptions
  deriving (Eq, Show)

instance I.ShortShow ClearAutosaveSettingsExceptions where
  shortShow
    ClearAutosaveSettingsExceptions
        = "ClearAutosaveSettingsExceptions"

instance AT.ToJSON ClearAutosaveSettingsExceptions where
  toJSON
    ClearAutosaveSettingsExceptions
        = A.object
          [ "@type" A..= AT.String "clearAutosaveSettingsExceptions"
          ]

