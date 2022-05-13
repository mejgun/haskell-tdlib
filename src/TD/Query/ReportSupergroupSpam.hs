{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReportSupergroupSpam where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Reports messages in a supergroup as spam; requires administrator rights in the supergroup @supergroup_id Supergroup identifier @message_ids Identifiers of messages to report
data ReportSupergroupSpam = ReportSupergroupSpam
  { -- |
    message_ids :: Maybe [Int],
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportSupergroupSpam where
  show
    ReportSupergroupSpam
      { message_ids = message_ids_,
        supergroup_id = supergroup_id_
      } =
      "ReportSupergroupSpam"
        ++ U.cc
          [ U.p "message_ids" message_ids_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ReportSupergroupSpam where
  toJSON
    ReportSupergroupSpam
      { message_ids = message_ids_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "reportSupergroupSpam",
          "message_ids" A..= message_ids_,
          "supergroup_id" A..= supergroup_id_
        ]
