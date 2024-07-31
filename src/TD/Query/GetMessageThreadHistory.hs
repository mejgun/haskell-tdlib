module TD.Query.GetMessageThreadHistory
  (GetMessageThreadHistory(..)
  , defaultGetMessageThreadHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns messages in a message thread of a message. Can be used only if messageProperties.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib. Returns 'TD.Data.Messages.Messages'
data GetMessageThreadHistory
  = GetMessageThreadHistory
    { chat_id         :: Maybe Int -- ^ Chat identifier
    , message_id      :: Maybe Int -- ^ Message identifier, which thread history needs to be returned
    , from_message_id :: Maybe Int -- ^ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    , offset          :: Maybe Int -- ^ Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
    , limit           :: Maybe Int -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageThreadHistory where
  shortShow
    GetMessageThreadHistory
      { chat_id         = chat_id_
      , message_id      = message_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      }
        = "GetMessageThreadHistory"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "message_id"      `I.p` message_id_
          , "from_message_id" `I.p` from_message_id_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetMessageThreadHistory where
  toJSON
    GetMessageThreadHistory
      { chat_id         = chat_id_
      , message_id      = message_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getMessageThreadHistory"
          , "chat_id"         A..= chat_id_
          , "message_id"      A..= message_id_
          , "from_message_id" A..= from_message_id_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          ]

defaultGetMessageThreadHistory :: GetMessageThreadHistory
defaultGetMessageThreadHistory =
  GetMessageThreadHistory
    { chat_id         = Nothing
    , message_id      = Nothing
    , from_message_id = Nothing
    , offset          = Nothing
    , limit           = Nothing
    }

