module TD.Query.Close
  (Close(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent. Can be called before initialization. Returns 'TD.Data.Ok.Ok'
data Close
  = Close
  deriving (Eq, Show)

instance I.ShortShow Close where
  shortShow
    Close
        = "Close"

instance AT.ToJSON Close where
  toJSON
    Close
        = A.object
          [ "@type" A..= AT.String "close"
          ]

