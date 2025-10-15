module TD.Query.ToggleGroupCallCanSendMessages
  (ToggleGroupCallCanSendMessages(..)
  , defaultToggleGroupCallCanSendMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether participants of a group call can send messages there. Requires groupCall.can_toggle_can_send_messages right. Returns 'TD.Data.Ok.Ok'
data ToggleGroupCallCanSendMessages
  = ToggleGroupCallCanSendMessages
    { group_call_id     :: Maybe Int  -- ^ Group call identifier
    , can_send_messages :: Maybe Bool -- ^ New value of the can_send_messages setting
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGroupCallCanSendMessages where
  shortShow
    ToggleGroupCallCanSendMessages
      { group_call_id     = group_call_id_
      , can_send_messages = can_send_messages_
      }
        = "ToggleGroupCallCanSendMessages"
          ++ I.cc
          [ "group_call_id"     `I.p` group_call_id_
          , "can_send_messages" `I.p` can_send_messages_
          ]

instance AT.ToJSON ToggleGroupCallCanSendMessages where
  toJSON
    ToggleGroupCallCanSendMessages
      { group_call_id     = group_call_id_
      , can_send_messages = can_send_messages_
      }
        = A.object
          [ "@type"             A..= AT.String "toggleGroupCallCanSendMessages"
          , "group_call_id"     A..= group_call_id_
          , "can_send_messages" A..= can_send_messages_
          ]

defaultToggleGroupCallCanSendMessages :: ToggleGroupCallCanSendMessages
defaultToggleGroupCallCanSendMessages =
  ToggleGroupCallCanSendMessages
    { group_call_id     = Nothing
    , can_send_messages = Nothing
    }

