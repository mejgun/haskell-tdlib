module TD.Query.ReadBusinessMessage
  (ReadBusinessMessage(..)
  , defaultReadBusinessMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Reads a message on behalf of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data ReadBusinessMessage
  = ReadBusinessMessage
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection through which the message was received
    , chat_id                :: Maybe Int    -- ^ The chat the message belongs to
    , message_id             :: Maybe Int    -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow ReadBusinessMessage where
  shortShow
    ReadBusinessMessage
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      }
        = "ReadBusinessMessage"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          ]

instance AT.ToJSON ReadBusinessMessage where
  toJSON
    ReadBusinessMessage
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "readBusinessMessage"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          ]

defaultReadBusinessMessage :: ReadBusinessMessage
defaultReadBusinessMessage =
  ReadBusinessMessage
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    }

