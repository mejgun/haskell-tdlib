{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSessionCanAcceptSecretChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether a session can accept incoming secret chats @session_id Session identifier @can_accept_secret_chats Pass true to allow accepting secret chats by the session; pass false otherwise
data ToggleSessionCanAcceptSecretChats = ToggleSessionCanAcceptSecretChats
  { -- |
    can_accept_secret_chats :: Maybe Bool,
    -- |
    session_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSessionCanAcceptSecretChats where
  show
    ToggleSessionCanAcceptSecretChats
      { can_accept_secret_chats = can_accept_secret_chats_,
        session_id = session_id_
      } =
      "ToggleSessionCanAcceptSecretChats"
        ++ U.cc
          [ U.p "can_accept_secret_chats" can_accept_secret_chats_,
            U.p "session_id" session_id_
          ]

instance T.ToJSON ToggleSessionCanAcceptSecretChats where
  toJSON
    ToggleSessionCanAcceptSecretChats
      { can_accept_secret_chats = can_accept_secret_chats_,
        session_id = session_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSessionCanAcceptSecretChats",
          "can_accept_secret_chats" A..= can_accept_secret_chats_,
          "session_id" A..= U.toS session_id_
        ]
