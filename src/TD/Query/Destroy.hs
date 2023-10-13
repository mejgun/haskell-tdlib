module TD.Query.Destroy(Destroy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data Destroy -- ^ Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent. Can be called before authorization
  = Destroy
  deriving (Eq)

instance Show Destroy where
  show
    Destroy
        = "Destroy"

instance AT.ToJSON Destroy where
  toJSON
    Destroy
        = A.object
          [ "@type" A..= AT.String "destroy"
          ]
