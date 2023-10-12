module TD.Query.ToggleSessionCanAcceptCalls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ToggleSessionCanAcceptCalls -- ^ Toggles whether a session can accept incoming calls
  = ToggleSessionCanAcceptCalls
    { session_id       :: Maybe Int  -- ^ Session identifier
    , can_accept_calls :: Maybe Bool -- ^ Pass true to allow accepting incoming calls by the session; pass false otherwise
    }
  deriving (Eq)

instance Show ToggleSessionCanAcceptCalls where
  show
    ToggleSessionCanAcceptCalls
      { session_id       = session_id_
      , can_accept_calls = can_accept_calls_
      }
        = "ToggleSessionCanAcceptCalls"
          ++ I.cc
          [ "session_id"       `I.p` session_id_
          , "can_accept_calls" `I.p` can_accept_calls_
          ]

instance AT.ToJSON ToggleSessionCanAcceptCalls where
  toJSON
    ToggleSessionCanAcceptCalls
      { session_id       = session_id_
      , can_accept_calls = can_accept_calls_
      }
        = A.object
          [ "@type"            A..= AT.String "toggleSessionCanAcceptCalls"
          , "session_id"       A..= fmap I.writeInt64  session_id_
          , "can_accept_calls" A..= can_accept_calls_
          ]
