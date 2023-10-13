module TD.Query.GetActiveLiveLocationMessages
  (GetActiveLiveLocationMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns all active live locations that need to be updated by the application. The list is persistent across application restarts only if the message database is used
data GetActiveLiveLocationMessages
  = GetActiveLiveLocationMessages
  deriving (Eq)

instance Show GetActiveLiveLocationMessages where
  show
    GetActiveLiveLocationMessages
        = "GetActiveLiveLocationMessages"

instance AT.ToJSON GetActiveLiveLocationMessages where
  toJSON
    GetActiveLiveLocationMessages
        = A.object
          [ "@type" A..= AT.String "getActiveLiveLocationMessages"
          ]

