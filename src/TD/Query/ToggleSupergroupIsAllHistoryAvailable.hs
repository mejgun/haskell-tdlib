module TD.Query.ToggleSupergroupIsAllHistoryAvailable(ToggleSupergroupIsAllHistoryAvailable(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleSupergroupIsAllHistoryAvailable -- ^ Toggles whether the message history of a supergroup is available to new members; requires can_change_info administrator right
  = ToggleSupergroupIsAllHistoryAvailable
    { supergroup_id            :: Maybe Int  -- ^ The identifier of the supergroup
    , is_all_history_available :: Maybe Bool -- ^ The new value of is_all_history_available
    }
  deriving (Eq)

instance Show ToggleSupergroupIsAllHistoryAvailable where
  show
    ToggleSupergroupIsAllHistoryAvailable
      { supergroup_id            = supergroup_id_
      , is_all_history_available = is_all_history_available_
      }
        = "ToggleSupergroupIsAllHistoryAvailable"
          ++ I.cc
          [ "supergroup_id"            `I.p` supergroup_id_
          , "is_all_history_available" `I.p` is_all_history_available_
          ]

instance AT.ToJSON ToggleSupergroupIsAllHistoryAvailable where
  toJSON
    ToggleSupergroupIsAllHistoryAvailable
      { supergroup_id            = supergroup_id_
      , is_all_history_available = is_all_history_available_
      }
        = A.object
          [ "@type"                    A..= AT.String "toggleSupergroupIsAllHistoryAvailable"
          , "supergroup_id"            A..= supergroup_id_
          , "is_all_history_available" A..= is_all_history_available_
          ]
