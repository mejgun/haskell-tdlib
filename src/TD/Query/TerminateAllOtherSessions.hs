module TD.Query.TerminateAllOtherSessions
  (TerminateAllOtherSessions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Terminates all other sessions of the current user
data TerminateAllOtherSessions
  = TerminateAllOtherSessions
  deriving (Eq)

instance Show TerminateAllOtherSessions where
  show
    TerminateAllOtherSessions
        = "TerminateAllOtherSessions"

instance AT.ToJSON TerminateAllOtherSessions where
  toJSON
    TerminateAllOtherSessions
        = A.object
          [ "@type" A..= AT.String "terminateAllOtherSessions"
          ]

