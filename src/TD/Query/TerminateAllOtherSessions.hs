module TD.Query.TerminateAllOtherSessions
  (TerminateAllOtherSessions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Terminates all other sessions of the current user. Returns 'TD.Data.Ok.Ok'
data TerminateAllOtherSessions
  = TerminateAllOtherSessions
  deriving (Eq, Show)

instance I.ShortShow TerminateAllOtherSessions where
  shortShow
    TerminateAllOtherSessions
        = "TerminateAllOtherSessions"

instance AT.ToJSON TerminateAllOtherSessions where
  toJSON
    TerminateAllOtherSessions
        = A.object
          [ "@type" A..= AT.String "terminateAllOtherSessions"
          ]

