module TD.Query.GetMessagePublicForwards(GetMessagePublicForwards(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetMessagePublicForwards -- ^ Returns forwarded copies of a channel message to different public channels. For optimal performance, the number of returned messages is chosen by TDLib
  = GetMessagePublicForwards
    { chat_id    :: Maybe Int    -- ^ Chat identifier of the message
    , message_id :: Maybe Int    -- ^ Message identifier
    , offset     :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit      :: Maybe Int    -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq)

instance Show GetMessagePublicForwards where
  show
    GetMessagePublicForwards
      { chat_id    = chat_id_
      , message_id = message_id_
      , offset     = offset_
      , limit      = limit_
      }
        = "GetMessagePublicForwards"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON GetMessagePublicForwards where
  toJSON
    GetMessagePublicForwards
      { chat_id    = chat_id_
      , message_id = message_id_
      , offset     = offset_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessagePublicForwards"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          ]
