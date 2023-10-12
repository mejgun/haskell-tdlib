module TD.Query.SetAlarm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetAlarm -- ^ Succeeds after a specified amount of time has passed. Can be called before initialization
  = SetAlarm
    { seconds :: Maybe Double -- ^ Number of seconds before the function returns
    }
  deriving (Eq)

instance Show SetAlarm where
  show
    SetAlarm
      { seconds = seconds_
      }
        = "SetAlarm"
          ++ I.cc
          [ "seconds" `I.p` seconds_
          ]

instance AT.ToJSON SetAlarm where
  toJSON
    SetAlarm
      { seconds = seconds_
      }
        = A.object
          [ "@type"   A..= AT.String "setAlarm"
          , "seconds" A..= seconds_
          ]
