module TD.Query.PinChatMessage
  (PinChatMessage(..)
  , defaultPinChatMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Pins a message in a chat. A message can be pinned only if messageProperties.can_be_pinned. Returns 'TD.Data.Ok.Ok'
data PinChatMessage
  = PinChatMessage
    { chat_id              :: Maybe Int  -- ^ Identifier of the chat
    , message_id           :: Maybe Int  -- ^ Identifier of the new pinned message
    , disable_notification :: Maybe Bool -- ^ Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats
    , only_for_self        :: Maybe Bool -- ^ Pass true to pin the message only for self; private chats only
    }
  deriving (Eq, Show)

instance I.ShortShow PinChatMessage where
  shortShow
    PinChatMessage
      { chat_id              = chat_id_
      , message_id           = message_id_
      , disable_notification = disable_notification_
      , only_for_self        = only_for_self_
      }
        = "PinChatMessage"
          ++ I.cc
          [ "chat_id"              `I.p` chat_id_
          , "message_id"           `I.p` message_id_
          , "disable_notification" `I.p` disable_notification_
          , "only_for_self"        `I.p` only_for_self_
          ]

instance AT.ToJSON PinChatMessage where
  toJSON
    PinChatMessage
      { chat_id              = chat_id_
      , message_id           = message_id_
      , disable_notification = disable_notification_
      , only_for_self        = only_for_self_
      }
        = A.object
          [ "@type"                A..= AT.String "pinChatMessage"
          , "chat_id"              A..= chat_id_
          , "message_id"           A..= message_id_
          , "disable_notification" A..= disable_notification_
          , "only_for_self"        A..= only_for_self_
          ]

defaultPinChatMessage :: PinChatMessage
defaultPinChatMessage =
  PinChatMessage
    { chat_id              = Nothing
    , message_id           = Nothing
    , disable_notification = Nothing
    , only_for_self        = Nothing
    }

