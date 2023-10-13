module TD.Query.GetActiveSessions
  (GetActiveSessions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetActiveSessions -- ^ Returns all active sessions of the current user
  = GetActiveSessions
  deriving (Eq)

instance Show GetActiveSessions where
  show
    GetActiveSessions
        = "GetActiveSessions"

instance AT.ToJSON GetActiveSessions where
  toJSON
    GetActiveSessions
        = A.object
          [ "@type" A..= AT.String "getActiveSessions"
          ]

