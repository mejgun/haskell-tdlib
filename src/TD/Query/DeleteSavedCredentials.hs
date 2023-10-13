module TD.Query.DeleteSavedCredentials
  (DeleteSavedCredentials(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Deletes saved credentials for all payment provider bots
data DeleteSavedCredentials
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

