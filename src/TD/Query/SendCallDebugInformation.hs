{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendCallDebugInformation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends debug information for a call to Telegram servers @call_id Call identifier @debug_information Debug information in application-specific format
data SendCallDebugInformation = SendCallDebugInformation
  { -- |
    debug_information :: Maybe String,
    -- |
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendCallDebugInformation where
  show
    SendCallDebugInformation
      { debug_information = debug_information,
        call_id = call_id
      } =
      "SendCallDebugInformation"
        ++ U.cc
          [ U.p "debug_information" debug_information,
            U.p "call_id" call_id
          ]

instance T.ToJSON SendCallDebugInformation where
  toJSON
    SendCallDebugInformation
      { debug_information = debug_information,
        call_id = call_id
      } =
      A.object
        [ "@type" A..= T.String "sendCallDebugInformation",
          "debug_information" A..= debug_information,
          "call_id" A..= call_id
        ]
