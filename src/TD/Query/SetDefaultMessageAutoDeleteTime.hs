{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetDefaultMessageAutoDeleteTime where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageAutoDeleteTime as MessageAutoDeleteTime
import qualified Utils as U

-- |
-- Changes the default message auto-delete time for new chats @message_auto_delete_time New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
data SetDefaultMessageAutoDeleteTime = SetDefaultMessageAutoDeleteTime
  { -- |
    message_auto_delete_time :: Maybe MessageAutoDeleteTime.MessageAutoDeleteTime
  }
  deriving (Eq)

instance Show SetDefaultMessageAutoDeleteTime where
  show
    SetDefaultMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_
      } =
      "SetDefaultMessageAutoDeleteTime"
        ++ U.cc
          [ U.p "message_auto_delete_time" message_auto_delete_time_
          ]

instance T.ToJSON SetDefaultMessageAutoDeleteTime where
  toJSON
    SetDefaultMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_
      } =
      A.object
        [ "@type" A..= T.String "setDefaultMessageAutoDeleteTime",
          "message_auto_delete_time" A..= message_auto_delete_time_
        ]
