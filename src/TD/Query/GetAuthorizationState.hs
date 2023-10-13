module TD.Query.GetAuthorizationState
  (GetAuthorizationState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetAuthorizationState -- ^ Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state. Can be called before initialization
  = GetAuthorizationState
  deriving (Eq)

instance Show GetAuthorizationState where
  show
    GetAuthorizationState
        = "GetAuthorizationState"

instance AT.ToJSON GetAuthorizationState where
  toJSON
    GetAuthorizationState
        = A.object
          [ "@type" A..= AT.String "getAuthorizationState"
          ]

