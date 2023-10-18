module TD.Query.GetCurrentState
  (GetCurrentState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all updates needed to restore current TDLib state, i.e. all actual updateAuthorizationState/updateUser/updateNewChat and others. This is especially useful if TDLib is run in a separate process. Can be called before initialization. Returns 'TD.Data.Updates.Updates'
data GetCurrentState
  = GetCurrentState
  deriving (Eq, Show)

instance I.ShortShow GetCurrentState where
  shortShow
    GetCurrentState
        = "GetCurrentState"

instance AT.ToJSON GetCurrentState where
  toJSON
    GetCurrentState
        = A.object
          [ "@type" A..= AT.String "getCurrentState"
          ]

