{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendCallSignalingData where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends call signaling data @call_id Call identifier @data The data
data SendCallSignalingData = SendCallSignalingData
  { -- |
    _data :: Maybe String,
    -- |
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendCallSignalingData where
  show
    SendCallSignalingData
      { _data = _data_,
        call_id = call_id_
      } =
      "SendCallSignalingData"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "call_id" call_id_
          ]

instance T.ToJSON SendCallSignalingData where
  toJSON
    SendCallSignalingData
      { _data = _data_,
        call_id = call_id_
      } =
      A.object
        [ "@type" A..= T.String "sendCallSignalingData",
          "data" A..= _data_,
          "call_id" A..= call_id_
        ]
