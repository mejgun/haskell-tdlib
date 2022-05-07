{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetTdlibParameters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TdlibParameters as TdlibParameters
import qualified Utils as U

-- |
-- Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters @parameters Parameters for TDLib initialization
data SetTdlibParameters = SetTdlibParameters
  { -- |
    parameters :: Maybe TdlibParameters.TdlibParameters
  }
  deriving (Eq)

instance Show SetTdlibParameters where
  show
    SetTdlibParameters
      { parameters = parameters
      } =
      "SetTdlibParameters"
        ++ U.cc
          [ U.p "parameters" parameters
          ]

instance T.ToJSON SetTdlibParameters where
  toJSON
    SetTdlibParameters
      { parameters = parameters
      } =
      A.object
        [ "@type" A..= T.String "setTdlibParameters",
          "parameters" A..= parameters
        ]
