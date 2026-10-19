module TD.Query.AnswerTonConnectRequest
  (AnswerTonConnectRequest(..)
  , defaultAnswerTonConnectRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

-- | Sends an answer for a request received through TON Connect. Returns 'TD.Data.Ok.Ok'
data AnswerTonConnectRequest
  = AnswerTonConnectRequest
    { session_id :: Maybe Int           -- ^ Unique identifier of the TON Connect session
    , message_id :: Maybe Int           -- ^ Identifier of the message with the request
    , trace_id   :: Maybe T.Text        -- ^ Identifier to trace the request
    , body       :: Maybe BS.ByteString -- ^ Body of the response
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerTonConnectRequest where
  shortShow
    AnswerTonConnectRequest
      { session_id = session_id_
      , message_id = message_id_
      , trace_id   = trace_id_
      , body       = body_
      }
        = "AnswerTonConnectRequest"
          ++ I.cc
          [ "session_id" `I.p` session_id_
          , "message_id" `I.p` message_id_
          , "trace_id"   `I.p` trace_id_
          , "body"       `I.p` body_
          ]

instance AT.ToJSON AnswerTonConnectRequest where
  toJSON
    AnswerTonConnectRequest
      { session_id = session_id_
      , message_id = message_id_
      , trace_id   = trace_id_
      , body       = body_
      }
        = A.object
          [ "@type"      A..= AT.String "answerTonConnectRequest"
          , "session_id" A..= fmap I.writeInt64  session_id_
          , "message_id" A..= message_id_
          , "trace_id"   A..= trace_id_
          , "body"       A..= fmap I.writeBytes  body_
          ]

defaultAnswerTonConnectRequest :: AnswerTonConnectRequest
defaultAnswerTonConnectRequest =
  AnswerTonConnectRequest
    { session_id = Nothing
    , message_id = Nothing
    , trace_id   = Nothing
    , body       = Nothing
    }

