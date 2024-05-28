module TD.Query.ToggleSupergroupJoinToSendMessages
  (ToggleSupergroupJoinToSendMessages(..)
  , defaultToggleSupergroupJoinToSendMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether joining is mandatory to send messages to a discussion supergroup; requires can_restrict_members administrator right. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupJoinToSendMessages
  = ToggleSupergroupJoinToSendMessages
    { supergroup_id         :: Maybe Int  -- ^ Identifier of the supergroup that isn't a broadcast group
    , join_to_send_messages :: Maybe Bool -- ^ New value of join_to_send_messages
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupJoinToSendMessages where
  shortShow
    ToggleSupergroupJoinToSendMessages
      { supergroup_id         = supergroup_id_
      , join_to_send_messages = join_to_send_messages_
      }
        = "ToggleSupergroupJoinToSendMessages"
          ++ I.cc
          [ "supergroup_id"         `I.p` supergroup_id_
          , "join_to_send_messages" `I.p` join_to_send_messages_
          ]

instance AT.ToJSON ToggleSupergroupJoinToSendMessages where
  toJSON
    ToggleSupergroupJoinToSendMessages
      { supergroup_id         = supergroup_id_
      , join_to_send_messages = join_to_send_messages_
      }
        = A.object
          [ "@type"                 A..= AT.String "toggleSupergroupJoinToSendMessages"
          , "supergroup_id"         A..= supergroup_id_
          , "join_to_send_messages" A..= join_to_send_messages_
          ]

defaultToggleSupergroupJoinToSendMessages :: ToggleSupergroupJoinToSendMessages
defaultToggleSupergroupJoinToSendMessages =
  ToggleSupergroupJoinToSendMessages
    { supergroup_id         = Nothing
    , join_to_send_messages = Nothing
    }

