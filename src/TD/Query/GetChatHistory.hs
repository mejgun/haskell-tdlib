module TD.Query.GetChatHistory
  (GetChatHistory(..)
  , defaultGetChatHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns messages in a chat. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib. This is an offline request if only_local is true. Returns 'TD.Data.Messages.Messages'
data GetChatHistory
  = GetChatHistory
    { chat_id         :: Maybe Int  -- ^ Chat identifier
    , from_message_id :: Maybe Int  -- ^ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    , offset          :: Maybe Int  -- ^ Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
    , limit           :: Maybe Int  -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    , only_local      :: Maybe Bool -- ^ Pass true to get only messages that are available without sending network requests
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatHistory where
  shortShow
    GetChatHistory
      { chat_id         = chat_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      , only_local      = only_local_
      }
        = "GetChatHistory"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "from_message_id" `I.p` from_message_id_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          , "only_local"      `I.p` only_local_
          ]

instance AT.ToJSON GetChatHistory where
  toJSON
    GetChatHistory
      { chat_id         = chat_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      , only_local      = only_local_
      }
        = A.object
          [ "@type"           A..= AT.String "getChatHistory"
          , "chat_id"         A..= chat_id_
          , "from_message_id" A..= from_message_id_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          , "only_local"      A..= only_local_
          ]

defaultGetChatHistory :: GetChatHistory
defaultGetChatHistory =
  GetChatHistory
    { chat_id         = Nothing
    , from_message_id = Nothing
    , offset          = Nothing
    , limit           = Nothing
    , only_local      = Nothing
    }

