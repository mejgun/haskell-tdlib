module TD.Query.ToggleSessionCanAcceptSecretChats
  (ToggleSessionCanAcceptSecretChats(..)
  , defaultToggleSessionCanAcceptSecretChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a session can accept incoming secret chats. Returns 'TD.Data.Ok.Ok'
data ToggleSessionCanAcceptSecretChats
  = ToggleSessionCanAcceptSecretChats
    { session_id              :: Maybe Int  -- ^ Session identifier
    , can_accept_secret_chats :: Maybe Bool -- ^ Pass true to allow accepting secret chats by the session; pass false otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSessionCanAcceptSecretChats where
  shortShow
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
          , "session_id"              A..= fmap I.writeInt64  session_id_
          , "can_accept_secret_chats" A..= can_accept_secret_chats_
          ]

defaultToggleSessionCanAcceptSecretChats :: ToggleSessionCanAcceptSecretChats
defaultToggleSessionCanAcceptSecretChats =
  ToggleSessionCanAcceptSecretChats
    { session_id              = Nothing
    , can_accept_secret_chats = Nothing
    }

