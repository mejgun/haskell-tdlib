module TD.Query.ToggleSessionCanAcceptSecretChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ToggleSessionCanAcceptSecretChats -- ^ Toggles whether a session can accept incoming secret chats
  = ToggleSessionCanAcceptSecretChats
    { session_id              :: Maybe Int  -- ^ Session identifier
    , can_accept_secret_chats :: Maybe Bool -- ^ Pass true to allow accepting secret chats by the session; pass false otherwise
    }
  deriving (Eq)

instance Show ToggleSessionCanAcceptSecretChats where
  show
    ToggleSessionCanAcceptSecretChats
      { session_id              = session_id_
      , can_accept_secret_chats = can_accept_secret_chats_
      }
        = "ToggleSessionCanAcceptSecretChats"
          ++ I.cc
          [ "session_id"              `I.p` session_id_
          , "can_accept_secret_chats" `I.p` can_accept_secret_chats_
          ]

instance AT.ToJSON ToggleSessionCanAcceptSecretChats where
  toJSON
    ToggleSessionCanAcceptSecretChats
      { session_id              = session_id_
      , can_accept_secret_chats = can_accept_secret_chats_
      }
        = A.object
          [ "@type"                   A..= AT.String "toggleSessionCanAcceptSecretChats"
          , "session_id"              A..= I.toS session_id_
          , "can_accept_secret_chats" A..= can_accept_secret_chats_
          ]
