{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSessionCanAcceptCalls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether a session can accept incoming calls @session_id Session identifier @can_accept_calls Pass true to allow accepting incoming calls by the session; pass false otherwise
data ToggleSessionCanAcceptCalls = ToggleSessionCanAcceptCalls
  { -- |
    can_accept_calls :: Maybe Bool,
    -- |
    session_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSessionCanAcceptCalls where
  show
    ToggleSessionCanAcceptCalls
      { can_accept_calls = can_accept_calls_,
        session_id = session_id_
      } =
      "ToggleSessionCanAcceptCalls"
        ++ U.cc
          [ U.p "can_accept_calls" can_accept_calls_,
            U.p "session_id" session_id_
          ]

instance T.ToJSON ToggleSessionCanAcceptCalls where
  toJSON
    ToggleSessionCanAcceptCalls
      { can_accept_calls = can_accept_calls_,
        session_id = session_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSessionCanAcceptCalls",
          "can_accept_calls" A..= can_accept_calls_,
          "session_id" A..= session_id_
        ]
