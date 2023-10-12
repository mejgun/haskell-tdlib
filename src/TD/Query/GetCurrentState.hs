module TD.Query.GetCurrentState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetCurrentState -- ^ Returns all updates needed to restore current TDLib state, i.e. all actual updateAuthorizationState/updateUser/updateNewChat and others. This is especially useful if TDLib is run in a separate process. Can be called before initialization
  = GetCurrentState
  deriving (Eq)

instance Show GetCurrentState where
  show
    GetCurrentState
        = "GetCurrentState"

instance AT.ToJSON GetCurrentState where
  toJSON
    GetCurrentState
        = A.object
          [ "@type" A..= AT.String "getCurrentState"
          ]
