{-# LANGUAGE OverloadedStrings #-}

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
      { _data = _data,
        chat_id = chat_id,
        _type = _type
      } =
      "SaveApplicationLogEvent"
        ++ U.cc
          [ U.p "_data" _data,
            U.p "chat_id" chat_id,
            U.p "_type" _type
          ]

instance T.ToJSON SaveApplicationLogEvent where
  toJSON
    SaveApplicationLogEvent
      { _data = _data,
        chat_id = chat_id,
        _type = _type
      } =
      A.object
        [ "@type" A..= T.String "saveApplicationLogEvent",
          "data" A..= _data,
          "chat_id" A..= chat_id,
          "type" A..= _type
        ]
