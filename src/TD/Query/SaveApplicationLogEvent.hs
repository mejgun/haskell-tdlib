module TD.Query.SaveApplicationLogEvent
  (SaveApplicationLogEvent(..)
  , defaultSaveApplicationLogEvent
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.JsonValue as JsonValue

-- | Saves application log event on the server. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data SaveApplicationLogEvent
  = SaveApplicationLogEvent
    { _type   :: Maybe T.Text              -- ^ Event type
    , chat_id :: Maybe Int                 -- ^ Optional chat identifier, associated with the event
    , _data   :: Maybe JsonValue.JsonValue -- ^ The log event data
    }
  deriving (Eq, Show)

instance I.ShortShow SaveApplicationLogEvent where
  shortShow
    SaveApplicationLogEvent
      { _type   = _type_
      , chat_id = chat_id_
      , _data   = _data_
      }
        = "SaveApplicationLogEvent"
          ++ I.cc
          [ "_type"   `I.p` _type_
          , "chat_id" `I.p` chat_id_
          , "_data"   `I.p` _data_
          ]

instance AT.ToJSON SaveApplicationLogEvent where
  toJSON
    SaveApplicationLogEvent
      { _type   = _type_
      , chat_id = chat_id_
      , _data   = _data_
      }
        = A.object
          [ "@type"   A..= AT.String "saveApplicationLogEvent"
          , "type"    A..= _type_
          , "chat_id" A..= chat_id_
          , "data"    A..= _data_
          ]

defaultSaveApplicationLogEvent :: SaveApplicationLogEvent
defaultSaveApplicationLogEvent =
  SaveApplicationLogEvent
    { _type   = Nothing
    , chat_id = Nothing
    , _data   = Nothing
    }

