module TD.Query.DeleteSavedCredentials
  (DeleteSavedCredentials(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes saved credentials for all payment provider bots. Returns 'TD.Data.Ok.Ok'
data DeleteSavedCredentials
  = DeleteSavedCredentials
  deriving (Eq, Show)

instance I.ShortShow DeleteSavedCredentials where
  shortShow
    DeleteSavedCredentials
        = "DeleteSavedCredentials"

instance AT.ToJSON DeleteSavedCredentials where
  toJSON
    DeleteSavedCredentials
        = A.object
          [ "@type" A..= AT.String "deleteSavedCredentials"
          ]

