{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ConfirmSession where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Confirms an unconfirmed session of the current user from another device @session_id Session identifier
data ConfirmSession = ConfirmSession
  { -- |
    session_id :: Maybe Int
  }
  deriving (Eq)

instance Show ConfirmSession where
  show
    ConfirmSession
      { session_id = session_id_
      } =
      "ConfirmSession"
        ++ U.cc
          [ U.p "session_id" session_id_
          ]

instance T.ToJSON ConfirmSession where
  toJSON
    ConfirmSession
      { session_id = session_id_
      } =
      A.object
        [ "@type" A..= T.String "confirmSession",
          "session_id" A..= U.toS session_id_
        ]
