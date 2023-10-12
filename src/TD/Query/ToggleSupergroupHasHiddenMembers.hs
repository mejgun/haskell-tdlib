module TD.Query.ToggleSupergroupHasHiddenMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ToggleSupergroupHasHiddenMembers -- ^ Toggles whether non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers. Can be called only if supergroupFullInfo.can_hide_members == true
  = ToggleSupergroupHasHiddenMembers
    { supergroup_id      :: Maybe Int  -- ^ Identifier of the supergroup
    , has_hidden_members :: Maybe Bool -- ^ New value of has_hidden_members
    }
  deriving (Eq)

instance Show ToggleSupergroupHasHiddenMembers where
  show
    ToggleSupergroupHasHiddenMembers
      { supergroup_id      = supergroup_id_
      , has_hidden_members = has_hidden_members_
      }
        = "ToggleSupergroupHasHiddenMembers"
          ++ I.cc
          [ "supergroup_id"      `I.p` supergroup_id_
          , "has_hidden_members" `I.p` has_hidden_members_
          ]

instance AT.ToJSON ToggleSupergroupHasHiddenMembers where
  toJSON
    ToggleSupergroupHasHiddenMembers
      { supergroup_id      = supergroup_id_
      , has_hidden_members = has_hidden_members_
      }
        = A.object
          [ "@type"              A..= AT.String "toggleSupergroupHasHiddenMembers"
          , "supergroup_id"      A..= supergroup_id_
          , "has_hidden_members" A..= has_hidden_members_
          ]
