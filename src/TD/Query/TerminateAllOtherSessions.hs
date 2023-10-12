module TD.Query.TerminateAllOtherSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TerminateAllOtherSessions -- ^ Terminates all other sessions of the current user
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
