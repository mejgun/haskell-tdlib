module TD.Query.GetActiveSessions
  (GetActiveSessions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all active sessions of the current user. Returns 'TD.Data.Sessions.Sessions'
data GetActiveSessions
  = GetActiveSessions
  deriving (Eq, Show)

instance I.ShortShow GetActiveSessions where
  shortShow
    GetActiveSessions
        = "GetActiveSessions"

instance AT.ToJSON GetActiveSessions where
  toJSON
    GetActiveSessions
        = A.object
          [ "@type" A..= AT.String "getActiveSessions"
          ]

