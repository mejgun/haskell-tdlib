module TD.Query.Close
  (Close(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent. Can be called before initialization
data Close
  = Close
  deriving (Eq)

instance Show Close where
  show
    Close
        = "Close"

instance AT.ToJSON Close where
  toJSON
    Close
        = A.object
          [ "@type" A..= AT.String "close"
          ]

