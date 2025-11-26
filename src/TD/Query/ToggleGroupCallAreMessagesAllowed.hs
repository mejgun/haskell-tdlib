module TD.Query.ToggleGroupCallAreMessagesAllowed
  (ToggleGroupCallAreMessagesAllowed(..)
  , defaultToggleGroupCallAreMessagesAllowed
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether participants of a group call can send messages there. Requires groupCall.can_toggle_are_messages_allowed right. Returns 'TD.Data.Ok.Ok'
data ToggleGroupCallAreMessagesAllowed
  = ToggleGroupCallAreMessagesAllowed
    { group_call_id        :: Maybe Int  -- ^ Group call identifier
    , are_messages_allowed :: Maybe Bool -- ^ New value of the are_messages_allowed setting
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGroupCallAreMessagesAllowed where
  shortShow
    ToggleGroupCallAreMessagesAllowed
      { group_call_id        = group_call_id_
      , are_messages_allowed = are_messages_allowed_
      }
        = "ToggleGroupCallAreMessagesAllowed"
          ++ I.cc
          [ "group_call_id"        `I.p` group_call_id_
          , "are_messages_allowed" `I.p` are_messages_allowed_
          ]

instance AT.ToJSON ToggleGroupCallAreMessagesAllowed where
  toJSON
    ToggleGroupCallAreMessagesAllowed
      { group_call_id        = group_call_id_
      , are_messages_allowed = are_messages_allowed_
      }
        = A.object
          [ "@type"                A..= AT.String "toggleGroupCallAreMessagesAllowed"
          , "group_call_id"        A..= group_call_id_
          , "are_messages_allowed" A..= are_messages_allowed_
          ]

defaultToggleGroupCallAreMessagesAllowed :: ToggleGroupCallAreMessagesAllowed
defaultToggleGroupCallAreMessagesAllowed =
  ToggleGroupCallAreMessagesAllowed
    { group_call_id        = Nothing
    , are_messages_allowed = Nothing
    }

