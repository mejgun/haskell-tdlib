{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TerminateSession where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Terminates a session of the current user @session_id Session identifier
data TerminateSession = TerminateSession
  { -- |
    session_id :: Maybe Int
  }
  deriving (Eq)

instance Show TerminateSession where
  show
    TerminateSession
      { session_id = session_id
      } =
      "TerminateSession"
        ++ U.cc
          [ U.p "session_id" session_id
          ]

instance T.ToJSON TerminateSession where
  toJSON
    TerminateSession
      { session_id = session_id
      } =
      A.object
        [ "@type" A..= T.String "terminateSession",
          "session_id" A..= session_id
        ]
