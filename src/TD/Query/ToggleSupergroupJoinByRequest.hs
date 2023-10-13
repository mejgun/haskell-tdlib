module TD.Query.ToggleSupergroupJoinByRequest(ToggleSupergroupJoinByRequest(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleSupergroupJoinByRequest -- ^ Toggles whether all users directly joining the supergroup need to be approved by supergroup administrators; requires can_restrict_members administrator right
  = ToggleSupergroupJoinByRequest
    { supergroup_id   :: Maybe Int  -- ^ Identifier of the channel
    , join_by_request :: Maybe Bool -- ^ New value of join_by_request
    }
  deriving (Eq)

instance Show ToggleSupergroupJoinByRequest where
  show
    ToggleSupergroupJoinByRequest
      { supergroup_id   = supergroup_id_
      , join_by_request = join_by_request_
      }
        = "ToggleSupergroupJoinByRequest"
          ++ I.cc
          [ "supergroup_id"   `I.p` supergroup_id_
          , "join_by_request" `I.p` join_by_request_
          ]

instance AT.ToJSON ToggleSupergroupJoinByRequest where
  toJSON
    ToggleSupergroupJoinByRequest
      { supergroup_id   = supergroup_id_
      , join_by_request = join_by_request_
      }
        = A.object
          [ "@type"           A..= AT.String "toggleSupergroupJoinByRequest"
          , "supergroup_id"   A..= supergroup_id_
          , "join_by_request" A..= join_by_request_
          ]
