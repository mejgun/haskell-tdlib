module TD.Query.TerminateSession
  (TerminateSession(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Terminates a session of the current user. Returns 'TD.Data.Ok.Ok'
data TerminateSession
  = TerminateSession
    { session_id :: Maybe Int -- ^ Session identifier
    }
  deriving (Eq, Show)

instance I.ShortShow TerminateSession where
  shortShow
    TerminateSession
      { session_id = session_id_
      }
        = "TerminateSession"
          ++ I.cc
          [ "session_id" `I.p` session_id_
          ]

instance AT.ToJSON TerminateSession where
  toJSON
    TerminateSession
      { session_id = session_id_
      }
        = A.object
          [ "@type"      A..= AT.String "terminateSession"
          , "session_id" A..= fmap I.writeInt64  session_id_
          ]

