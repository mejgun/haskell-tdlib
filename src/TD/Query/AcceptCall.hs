{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AcceptCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallProtocol as CallProtocol
import qualified Utils as U

-- |
-- Accepts an incoming call @call_id Call identifier @protocol The call protocols supported by the application
data AcceptCall = AcceptCall
  { -- |
    protocol :: Maybe CallProtocol.CallProtocol,
    -- |
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show AcceptCall where
  show
    AcceptCall
      { protocol = protocol_,
        call_id = call_id_
      } =
      "AcceptCall"
        ++ U.cc
          [ U.p "protocol" protocol_,
            U.p "call_id" call_id_
          ]

instance T.ToJSON AcceptCall where
  toJSON
    AcceptCall
      { protocol = protocol_,
        call_id = call_id_
      } =
      A.object
        [ "@type" A..= T.String "acceptCall",
          "protocol" A..= protocol_,
          "call_id" A..= call_id_
        ]
