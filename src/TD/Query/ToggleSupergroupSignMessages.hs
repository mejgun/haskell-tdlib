module TD.Query.ToggleSupergroupSignMessages
  (ToggleSupergroupSignMessages(..)
  , defaultToggleSupergroupSignMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether sender signature is added to sent messages in a channel; requires can_change_info administrator right
data ToggleSupergroupSignMessages
  = ToggleSupergroupSignMessages
    { supergroup_id :: Maybe Int  -- ^ Identifier of the channel
    , sign_messages :: Maybe Bool -- ^ New value of sign_messages
    }
  deriving (Eq)

instance Show ToggleSupergroupSignMessages where
  show
    ToggleSupergroupSignMessages
      { supergroup_id = supergroup_id_
      , sign_messages = sign_messages_
      }
        = "ToggleSupergroupSignMessages"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "sign_messages" `I.p` sign_messages_
          ]

instance AT.ToJSON ToggleSupergroupSignMessages where
  toJSON
    ToggleSupergroupSignMessages
      { supergroup_id = supergroup_id_
      , sign_messages = sign_messages_
      }
        = A.object
          [ "@type"         A..= AT.String "toggleSupergroupSignMessages"
          , "supergroup_id" A..= supergroup_id_
          , "sign_messages" A..= sign_messages_
          ]

defaultToggleSupergroupSignMessages :: ToggleSupergroupSignMessages
defaultToggleSupergroupSignMessages =
  ToggleSupergroupSignMessages
    { supergroup_id = Nothing
    , sign_messages = Nothing
    }

