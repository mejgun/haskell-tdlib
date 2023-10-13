module TD.Query.ReportSupergroupSpam(ReportSupergroupSpam(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ReportSupergroupSpam -- ^ Reports messages in a supergroup as spam; requires administrator rights in the supergroup
  = ReportSupergroupSpam
    { supergroup_id :: Maybe Int   -- ^ Supergroup identifier
    , message_ids   :: Maybe [Int] -- ^ Identifiers of messages to report
    }
  deriving (Eq)

instance Show ReportSupergroupSpam where
  show
    ReportSupergroupSpam
      { supergroup_id = supergroup_id_
      , message_ids   = message_ids_
      }
        = "ReportSupergroupSpam"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "message_ids"   `I.p` message_ids_
          ]

instance AT.ToJSON ReportSupergroupSpam where
  toJSON
    ReportSupergroupSpam
      { supergroup_id = supergroup_id_
      , message_ids   = message_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "reportSupergroupSpam"
          , "supergroup_id" A..= supergroup_id_
          , "message_ids"   A..= message_ids_
          ]
