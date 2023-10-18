module TD.Query.Destroy
  (Destroy(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data Destroy
  = Destroy
  deriving (Eq, Show)

instance I.ShortShow Destroy where
  shortShow
    Destroy
        = "Destroy"

instance AT.ToJSON Destroy where
  toJSON
    Destroy
        = A.object
          [ "@type" A..= AT.String "destroy"
          ]

