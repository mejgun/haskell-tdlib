module TD.Query.ToggleSupergroupSignMessages
  (ToggleSupergroupSignMessages(..)
  , defaultToggleSupergroupSignMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether sender signature or link to the account is added to sent messages in a channel; requires can_change_info member right. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupSignMessages
  = ToggleSupergroupSignMessages
    { supergroup_id       :: Maybe Int  -- ^ Identifier of the channel
    , sign_messages       :: Maybe Bool -- ^ New value of sign_messages
    , show_message_sender :: Maybe Bool -- ^ New value of show_message_sender
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupSignMessages where
  shortShow
    ToggleSupergroupSignMessages
      { supergroup_id       = supergroup_id_
      , sign_messages       = sign_messages_
      , show_message_sender = show_message_sender_
      }
        = "ToggleSupergroupSignMessages"
          ++ I.cc
          [ "supergroup_id"       `I.p` supergroup_id_
          , "sign_messages"       `I.p` sign_messages_
          , "show_message_sender" `I.p` show_message_sender_
          ]

instance AT.ToJSON ToggleSupergroupSignMessages where
  toJSON
    ToggleSupergroupSignMessages
      { supergroup_id       = supergroup_id_
      , sign_messages       = sign_messages_
      , show_message_sender = show_message_sender_
      }
        = A.object
          [ "@type"               A..= AT.String "toggleSupergroupSignMessages"
          , "supergroup_id"       A..= supergroup_id_
          , "sign_messages"       A..= sign_messages_
          , "show_message_sender" A..= show_message_sender_
          ]

defaultToggleSupergroupSignMessages :: ToggleSupergroupSignMessages
defaultToggleSupergroupSignMessages =
  ToggleSupergroupSignMessages
    { supergroup_id       = Nothing
    , sign_messages       = Nothing
    , show_message_sender = Nothing
    }

