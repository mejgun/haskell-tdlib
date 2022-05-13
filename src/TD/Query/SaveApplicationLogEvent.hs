{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SaveApplicationLogEvent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.JsonValue as JsonValue
import qualified Utils as U

-- |
-- Saves application log event on the server. Can be called before authorization @type Event type @chat_id Optional chat identifier, associated with the event @data The log event data
data SaveApplicationLogEvent = SaveApplicationLogEvent
  { -- |
    _data :: Maybe JsonValue.JsonValue,
    -- |
    chat_id :: Maybe Int,
    -- |
    _type :: Maybe String
  }
  deriving (Eq)

instance Show SaveApplicationLogEvent where
  show
    SaveApplicationLogEvent
      { _data = _data_,
        chat_id = chat_id_,
        _type = _type_
      } =
      "SaveApplicationLogEvent"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "chat_id" chat_id_,
            U.p "_type" _type_
          ]

instance T.ToJSON SaveApplicationLogEvent where
  toJSON
    SaveApplicationLogEvent
      { _data = _data_,
        chat_id = chat_id_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "saveApplicationLogEvent",
          "data" A..= _data_,
          "chat_id" A..= chat_id_,
          "type" A..= _type_
        ]
