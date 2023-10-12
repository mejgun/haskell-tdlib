module TD.Query.ClearAutosaveSettingsExceptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
