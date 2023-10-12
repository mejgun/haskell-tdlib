module TD.Data.MessageSendOptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState

data MessageSendOptions
  = MessageSendOptions -- ^ Options to be used when a message is sent
    { disable_notification                   :: Maybe Bool                                          -- ^ Pass true to disable notification for the message
    , from_background                        :: Maybe Bool                                          -- ^ Pass true if the message is sent from the background
    , protect_content                        :: Maybe Bool                                          -- ^ Pass true if the content of the message must be protected from forwarding and saving; for bots only
    , update_order_of_installed_sticker_sets :: Maybe Bool                                          -- ^ Pass true if the user explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
    , scheduling_state                       :: Maybe MessageSchedulingState.MessageSchedulingState -- ^ Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
    , sending_id                             :: Maybe Int                                           -- ^ Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
    }
  deriving (Eq)

instance Show MessageSendOptions where
  show MessageSendOptions
    { disable_notification                   = disable_notification_
    , from_background                        = from_background_
    , protect_content                        = protect_content_
    , update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_
    , scheduling_state                       = scheduling_state_
    , sending_id                             = sending_id_
    }
      = "MessageSendOptions"
        ++ I.cc
        [ "disable_notification"                   `I.p` disable_notification_
        , "from_background"                        `I.p` from_background_
        , "protect_content"                        `I.p` protect_content_
        , "update_order_of_installed_sticker_sets" `I.p` update_order_of_installed_sticker_sets_
        , "scheduling_state"                       `I.p` scheduling_state_
        , "sending_id"                             `I.p` sending_id_
        ]

instance AT.FromJSON MessageSendOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSendOptions" -> parseMessageSendOptions v
      _                    -> mempty
    
    where
      parseMessageSendOptions :: A.Value -> AT.Parser MessageSendOptions
      parseMessageSendOptions = A.withObject "MessageSendOptions" $ \o -> do
        disable_notification_                   <- o A..:?  "disable_notification"
        from_background_                        <- o A..:?  "from_background"
        protect_content_                        <- o A..:?  "protect_content"
        update_order_of_installed_sticker_sets_ <- o A..:?  "update_order_of_installed_sticker_sets"
        scheduling_state_                       <- o A..:?  "scheduling_state"
        sending_id_                             <- o A..:?  "sending_id"
        pure $ MessageSendOptions
          { disable_notification                   = disable_notification_
          , from_background                        = from_background_
          , protect_content                        = protect_content_
          , update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_
          , scheduling_state                       = scheduling_state_
          , sending_id                             = sending_id_
          }

instance AT.ToJSON MessageSendOptions where
  toJSON MessageSendOptions
    { disable_notification                   = disable_notification_
    , from_background                        = from_background_
    , protect_content                        = protect_content_
    , update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_
    , scheduling_state                       = scheduling_state_
    , sending_id                             = sending_id_
    }
      = A.object
        [ "@type"                                  A..= AT.String "messageSendOptions"
        , "disable_notification"                   A..= disable_notification_
        , "from_background"                        A..= from_background_
        , "protect_content"                        A..= protect_content_
        , "update_order_of_installed_sticker_sets" A..= update_order_of_installed_sticker_sets_
        , "scheduling_state"                       A..= scheduling_state_
        , "sending_id"                             A..= sending_id_
        ]
