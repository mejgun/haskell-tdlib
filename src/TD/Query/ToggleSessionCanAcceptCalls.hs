module TD.Query.ToggleSessionCanAcceptCalls
  (ToggleSessionCanAcceptCalls(..)
  , defaultToggleSessionCanAcceptCalls
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a session can accept incoming calls. Returns 'TD.Data.Ok.Ok'
data ToggleSessionCanAcceptCalls
  = ToggleSessionCanAcceptCalls
    { session_id       :: Maybe Int  -- ^ Session identifier
    , can_accept_calls :: Maybe Bool -- ^ Pass true to allow accepting incoming calls by the session; pass false otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSessionCanAcceptCalls where
  shortShow
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

defaultToggleSessionCanAcceptCalls :: ToggleSessionCanAcceptCalls
defaultToggleSessionCanAcceptCalls =
  ToggleSessionCanAcceptCalls
    { session_id       = Nothing
    , can_accept_calls = Nothing
    }

