module TD.Query.SetLiveStoryMessageSender
  (SetLiveStoryMessageSender(..)
  , defaultSetLiveStoryMessageSender
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Selects a message sender to send messages in a live story call. Returns 'TD.Data.Ok.Ok'
data SetLiveStoryMessageSender
  = SetLiveStoryMessageSender
    { group_call_id     :: Maybe Int                         -- ^ Group call identifier
    , message_sender_id :: Maybe MessageSender.MessageSender -- ^ New message sender for the group call
    }
  deriving (Eq, Show)

instance I.ShortShow SetLiveStoryMessageSender where
  shortShow
    SetLiveStoryMessageSender
      { group_call_id     = group_call_id_
      , message_sender_id = message_sender_id_
      }
        = "SetLiveStoryMessageSender"
          ++ I.cc
          [ "group_call_id"     `I.p` group_call_id_
          , "message_sender_id" `I.p` message_sender_id_
          ]

instance AT.ToJSON SetLiveStoryMessageSender where
  toJSON
    SetLiveStoryMessageSender
      { group_call_id     = group_call_id_
      , message_sender_id = message_sender_id_
      }
        = A.object
          [ "@type"             A..= AT.String "setLiveStoryMessageSender"
          , "group_call_id"     A..= group_call_id_
          , "message_sender_id" A..= message_sender_id_
          ]

defaultSetLiveStoryMessageSender :: SetLiveStoryMessageSender
defaultSetLiveStoryMessageSender =
  SetLiveStoryMessageSender
    { group_call_id     = Nothing
    , message_sender_id = Nothing
    }

