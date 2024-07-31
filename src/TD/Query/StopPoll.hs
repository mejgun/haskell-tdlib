module TD.Query.StopPoll
  (StopPoll(..)
  , defaultStopPoll
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup

-- | Stops a poll. Returns 'TD.Data.Ok.Ok'
data StopPoll
  = StopPoll
    { chat_id      :: Maybe Int                     -- ^ Identifier of the chat to which the poll belongs
    , message_id   :: Maybe Int                     -- ^ Identifier of the message containing the poll. Use messageProperties.can_be_edited to check whether the poll can be stopped
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none; for bots only
    }
  deriving (Eq, Show)

instance I.ShortShow StopPoll where
  shortShow
    StopPoll
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      }
        = "StopPoll"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "reply_markup" `I.p` reply_markup_
          ]

instance AT.ToJSON StopPoll where
  toJSON
    StopPoll
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      }
        = A.object
          [ "@type"        A..= AT.String "stopPoll"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "reply_markup" A..= reply_markup_
          ]

defaultStopPoll :: StopPoll
defaultStopPoll =
  StopPoll
    { chat_id      = Nothing
    , message_id   = Nothing
    , reply_markup = Nothing
    }

