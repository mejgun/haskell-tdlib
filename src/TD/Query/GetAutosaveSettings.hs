module TD.Query.GetAutosaveSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetAutosaveSettings -- ^ Returns autosave settings for the current user
  = GetAutosaveSettings
  deriving (Eq)

instance Show GetAutosaveSettings where
  show
    GetAutosaveSettings
        = "GetAutosaveSettings"

instance AT.ToJSON GetAutosaveSettings where
  toJSON
    GetAutosaveSettings
        = A.object
          [ "@type" A..= AT.String "getAutosaveSettings"
          ]
