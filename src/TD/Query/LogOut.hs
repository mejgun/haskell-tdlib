module TD.Query.LogOut(LogOut(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data LogOut -- ^ Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
  = LogOut
  deriving (Eq)

instance Show LogOut where
  show
    LogOut
        = "LogOut"

instance AT.ToJSON LogOut where
  toJSON
    LogOut
        = A.object
          [ "@type" A..= AT.String "logOut"
          ]
