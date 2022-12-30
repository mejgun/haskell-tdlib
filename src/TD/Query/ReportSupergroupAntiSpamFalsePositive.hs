{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReportSupergroupAntiSpamFalsePositive where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Reports a false deletion of a message by aggressive anti-spam checks; requires administrator rights in the supergroup. Can be called only for messages from chatEventMessageDeleted with can_report_anti_spam_false_positive == true
data ReportSupergroupAntiSpamFalsePositive = ReportSupergroupAntiSpamFalsePositive
  { -- | Identifier of the erroneously deleted message
    message_id :: Maybe Int,
    -- | Supergroup identifier
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportSupergroupAntiSpamFalsePositive where
  show
    ReportSupergroupAntiSpamFalsePositive
      { message_id = message_id_,
        supergroup_id = supergroup_id_
      } =
      "ReportSupergroupAntiSpamFalsePositive"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ReportSupergroupAntiSpamFalsePositive where
  toJSON
    ReportSupergroupAntiSpamFalsePositive
      { message_id = message_id_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "reportSupergroupAntiSpamFalsePositive",
          "message_id" A..= message_id_,
          "supergroup_id" A..= supergroup_id_
        ]
