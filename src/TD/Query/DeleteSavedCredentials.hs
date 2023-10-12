module TD.Query.DeleteSavedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DeleteSavedCredentials -- ^ Deletes saved credentials for all payment provider bots
  = DeleteSavedCredentials
  deriving (Eq)

instance Show DeleteSavedCredentials where
  show
    DeleteSavedCredentials
        = "DeleteSavedCredentials"

instance AT.ToJSON DeleteSavedCredentials where
  toJSON
    DeleteSavedCredentials
        = A.object
          [ "@type" A..= AT.String "deleteSavedCredentials"
          ]
