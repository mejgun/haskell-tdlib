module TD.Query.ToggleSupergroupIsAllHistoryAvailable
  (ToggleSupergroupIsAllHistoryAvailable(..)
  , defaultToggleSupergroupIsAllHistoryAvailable
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether the message history of a supergroup is available to new members; requires can_change_info member right. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupIsAllHistoryAvailable
  = ToggleSupergroupIsAllHistoryAvailable
    { supergroup_id            :: Maybe Int  -- ^ The identifier of the supergroup
    , is_all_history_available :: Maybe Bool -- ^ The new value of is_all_history_available
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupIsAllHistoryAvailable where
  shortShow
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

defaultToggleSupergroupIsAllHistoryAvailable :: ToggleSupergroupIsAllHistoryAvailable
defaultToggleSupergroupIsAllHistoryAvailable =
  ToggleSupergroupIsAllHistoryAvailable
    { supergroup_id            = Nothing
    , is_all_history_available = Nothing
    }

