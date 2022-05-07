{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendCustomRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends a custom request; for bots only @method The method name @parameters JSON-serialized method parameters
data SendCustomRequest = SendCustomRequest
  { -- |
    parameters :: Maybe String,
    -- |
    method :: Maybe String
  }
  deriving (Eq)

instance Show SendCustomRequest where
  show
    SendCustomRequest
      { parameters = parameters,
        method = method
      } =
      "SendCustomRequest"
        ++ U.cc
          [ U.p "parameters" parameters,
            U.p "method" method
          ]

instance T.ToJSON SendCustomRequest where
  toJSON
    SendCustomRequest
      { parameters = parameters,
        method = method
      } =
      A.object
        [ "@type" A..= T.String "sendCustomRequest",
          "parameters" A..= parameters,
          "method" A..= method
        ]
