module TD.Query.SendTonConnectSessionConnectResult
  (SendTonConnectSessionConnectResult(..)
  , defaultSendTonConnectSessionConnectResult
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Accepts or rejects a TON Connect session. Returns 'TD.Data.Ok.Ok'
data SendTonConnectSessionConnectResult
  = SendTonConnectSessionConnectResult
    { session_id       :: Maybe Int           -- ^ Unique identifier of the session
    , challenge_answer :: Maybe BS.ByteString -- ^ Answer to the challenge received from setTonConnectSessionWalletClientId
    , is_error         :: Maybe Bool          -- ^ Pass true to reject the request; pass false to accept it
    , body             :: Maybe BS.ByteString -- ^ Body of the result
    , trace_id         :: Maybe T.Text        -- ^ Identifier to trace the connection request
    }
  deriving (Eq, Show)

instance I.ShortShow SendTonConnectSessionConnectResult where
  shortShow
    SendTonConnectSessionConnectResult
      { session_id       = session_id_
      , challenge_answer = challenge_answer_
      , is_error         = is_error_
      , body             = body_
      , trace_id         = trace_id_
      }
        = "SendTonConnectSessionConnectResult"
          ++ I.cc
          [ "session_id"       `I.p` session_id_
          , "challenge_answer" `I.p` challenge_answer_
          , "is_error"         `I.p` is_error_
          , "body"             `I.p` body_
          , "trace_id"         `I.p` trace_id_
          ]

instance AT.ToJSON SendTonConnectSessionConnectResult where
  toJSON
    SendTonConnectSessionConnectResult
      { session_id       = session_id_
      , challenge_answer = challenge_answer_
      , is_error         = is_error_
      , body             = body_
      , trace_id         = trace_id_
      }
        = A.object
          [ "@type"            A..= AT.String "sendTonConnectSessionConnectResult"
          , "session_id"       A..= fmap I.writeInt64  session_id_
          , "challenge_answer" A..= fmap I.writeBytes  challenge_answer_
          , "is_error"         A..= is_error_
          , "body"             A..= fmap I.writeBytes  body_
          , "trace_id"         A..= trace_id_
          ]

defaultSendTonConnectSessionConnectResult :: SendTonConnectSessionConnectResult
defaultSendTonConnectSessionConnectResult =
  SendTonConnectSessionConnectResult
    { session_id       = Nothing
    , challenge_answer = Nothing
    , is_error         = Nothing
    , body             = Nothing
    , trace_id         = Nothing
    }

