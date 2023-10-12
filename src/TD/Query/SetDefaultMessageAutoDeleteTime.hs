module TD.Query.SetDefaultMessageAutoDeleteTime where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageAutoDeleteTime as MessageAutoDeleteTime

data SetDefaultMessageAutoDeleteTime -- ^ Changes the default message auto-delete time for new chats
  = SetDefaultMessageAutoDeleteTime
    { message_auto_delete_time :: Maybe MessageAutoDeleteTime.MessageAutoDeleteTime -- ^ New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    }
  deriving (Eq)

instance Show SetDefaultMessageAutoDeleteTime where
  show
    SetDefaultMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_
      }
        = "SetDefaultMessageAutoDeleteTime"
          ++ I.cc
          [ "message_auto_delete_time" `I.p` message_auto_delete_time_
          ]

instance AT.ToJSON SetDefaultMessageAutoDeleteTime where
  toJSON
    SetDefaultMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_
      }
        = A.object
          [ "@type"                    A..= AT.String "setDefaultMessageAutoDeleteTime"
          , "message_auto_delete_time" A..= message_auto_delete_time_
          ]
