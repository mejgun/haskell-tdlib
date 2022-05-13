{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetAlarm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Succeeds after a specified amount of time has passed. Can be called before initialization @seconds Number of seconds before the function returns
data SetAlarm = SetAlarm
  { -- |
    seconds :: Maybe Float
  }
  deriving (Eq)

instance Show SetAlarm where
  show
    SetAlarm
      { seconds = seconds_
      } =
      "SetAlarm"
        ++ U.cc
          [ U.p "seconds" seconds_
          ]

instance T.ToJSON SetAlarm where
  toJSON
    SetAlarm
      { seconds = seconds_
      } =
      A.object
        [ "@type" A..= T.String "setAlarm",
          "seconds" A..= seconds_
        ]
