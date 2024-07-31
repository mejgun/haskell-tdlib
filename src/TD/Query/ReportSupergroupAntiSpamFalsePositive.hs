module TD.Query.ReportSupergroupAntiSpamFalsePositive
  (ReportSupergroupAntiSpamFalsePositive(..)
  , defaultReportSupergroupAntiSpamFalsePositive
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Reports a false deletion of a message by aggressive anti-spam checks; requires administrator rights in the supergroup. Can be called only for messages from chatEventMessageDeleted with can_report_anti_spam_false_positive == true. Returns 'TD.Data.Ok.Ok'
data ReportSupergroupAntiSpamFalsePositive
  = ReportSupergroupAntiSpamFalsePositive
    { supergroup_id :: Maybe Int -- ^ Supergroup identifier
    , message_id    :: Maybe Int -- ^ Identifier of the erroneously deleted message from chatEventMessageDeleted
    }
  deriving (Eq, Show)

instance I.ShortShow ReportSupergroupAntiSpamFalsePositive where
  shortShow
    ReportSupergroupAntiSpamFalsePositive
      { supergroup_id = supergroup_id_
      , message_id    = message_id_
      }
        = "ReportSupergroupAntiSpamFalsePositive"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "message_id"    `I.p` message_id_
          ]

instance AT.ToJSON ReportSupergroupAntiSpamFalsePositive where
  toJSON
    ReportSupergroupAntiSpamFalsePositive
      { supergroup_id = supergroup_id_
      , message_id    = message_id_
      }
        = A.object
          [ "@type"         A..= AT.String "reportSupergroupAntiSpamFalsePositive"
          , "supergroup_id" A..= supergroup_id_
          , "message_id"    A..= message_id_
          ]

defaultReportSupergroupAntiSpamFalsePositive :: ReportSupergroupAntiSpamFalsePositive
defaultReportSupergroupAntiSpamFalsePositive =
  ReportSupergroupAntiSpamFalsePositive
    { supergroup_id = Nothing
    , message_id    = Nothing
    }

