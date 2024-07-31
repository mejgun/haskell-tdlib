module TD.Query.ReportMessageReactions
  (ReportMessageReactions(..)
  , defaultReportMessageReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Reports reactions set on a message to the Telegram moderators. Reactions on a message can be reported only if messageProperties.can_report_reactions. Returns 'TD.Data.Ok.Ok'
data ReportMessageReactions
  = ReportMessageReactions
    { chat_id    :: Maybe Int                         -- ^ Chat identifier
    , message_id :: Maybe Int                         -- ^ Message identifier
    , sender_id  :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender, which added the reaction
    }
  deriving (Eq, Show)

instance I.ShortShow ReportMessageReactions where
  shortShow
    ReportMessageReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      , sender_id  = sender_id_
      }
        = "ReportMessageReactions"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "sender_id"  `I.p` sender_id_
          ]

instance AT.ToJSON ReportMessageReactions where
  toJSON
    ReportMessageReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      , sender_id  = sender_id_
      }
        = A.object
          [ "@type"      A..= AT.String "reportMessageReactions"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "sender_id"  A..= sender_id_
          ]

defaultReportMessageReactions :: ReportMessageReactions
defaultReportMessageReactions =
  ReportMessageReactions
    { chat_id    = Nothing
    , message_id = Nothing
    , sender_id  = Nothing
    }

