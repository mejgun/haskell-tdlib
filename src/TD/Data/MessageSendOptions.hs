module TD.Data.MessageSendOptions
  ( MessageSendOptions(..)    
  , defaultMessageSendOptions 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState

data MessageSendOptions
  = MessageSendOptions -- ^ Options to be used when a message is sent
    { disable_notification                   :: Maybe Bool                                          -- ^ Pass true to disable notification for the message
    , from_background                        :: Maybe Bool                                          -- ^ Pass true if the message is sent from the background
    , protect_content                        :: Maybe Bool                                          -- ^ Pass true if the content of the message must be protected from forwarding and saving; for bots only
    , allow_paid_broadcast                   :: Maybe Bool                                          -- ^ Pass true to allow the message to ignore regular broadcast limits for a small fee; for bots only
    , update_order_of_installed_sticker_sets :: Maybe Bool                                          -- ^ Pass true if the user explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
    , scheduling_state                       :: Maybe MessageSchedulingState.MessageSchedulingState -- ^ Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
    , effect_id                              :: Maybe Int                                           -- ^ Identifier of the effect to apply to the message; pass 0 if none; applicable only to sendMessage and sendMessageAlbum in private chats
    , sending_id                             :: Maybe Int                                           -- ^ Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
    , only_preview                           :: Maybe Bool                                          -- ^ Pass true to get a fake message instead of actually sending them
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSendOptions where
  shortShow MessageSendOptions
    { disable_notification                   = disable_notification_
    , from_background                        = from_background_
    , protect_content                        = protect_content_
    , allow_paid_broadcast                   = allow_paid_broadcast_
    , update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_
    , scheduling_state                       = scheduling_state_
    , effect_id                              = effect_id_
    , sending_id                             = sending_id_
    , only_preview                           = only_preview_
    }
      = "MessageSendOptions"
        ++ I.cc
        [ "disable_notification"                   `I.p` disable_notification_
        , "from_background"                        `I.p` from_background_
        , "protect_content"                        `I.p` protect_content_
        , "allow_paid_broadcast"                   `I.p` allow_paid_broadcast_
        , "update_order_of_installed_sticker_sets" `I.p` update_order_of_installed_sticker_sets_
        , "scheduling_state"                       `I.p` scheduling_state_
        , "effect_id"                              `I.p` effect_id_
        , "sending_id"                             `I.p` sending_id_
        , "only_preview"                           `I.p` only_preview_
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
        disable_notification_                   <- o A..:?                       "disable_notification"
        from_background_                        <- o A..:?                       "from_background"
        protect_content_                        <- o A..:?                       "protect_content"
        allow_paid_broadcast_                   <- o A..:?                       "allow_paid_broadcast"
        update_order_of_installed_sticker_sets_ <- o A..:?                       "update_order_of_installed_sticker_sets"
        scheduling_state_                       <- o A..:?                       "scheduling_state"
        effect_id_                              <- fmap I.readInt64 <$> o A..:?  "effect_id"
        sending_id_                             <- o A..:?                       "sending_id"
        only_preview_                           <- o A..:?                       "only_preview"
        pure $ MessageSendOptions
          { disable_notification                   = disable_notification_
          , from_background                        = from_background_
          , protect_content                        = protect_content_
          , allow_paid_broadcast                   = allow_paid_broadcast_
          , update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_
          , scheduling_state                       = scheduling_state_
          , effect_id                              = effect_id_
          , sending_id                             = sending_id_
          , only_preview                           = only_preview_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageSendOptions where
  toJSON MessageSendOptions
    { disable_notification                   = disable_notification_
    , from_background                        = from_background_
    , protect_content                        = protect_content_
    , allow_paid_broadcast                   = allow_paid_broadcast_
    , update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_
    , scheduling_state                       = scheduling_state_
    , effect_id                              = effect_id_
    , sending_id                             = sending_id_
    , only_preview                           = only_preview_
    }
      = A.object
        [ "@type"                                  A..= AT.String "messageSendOptions"
        , "disable_notification"                   A..= disable_notification_
        , "from_background"                        A..= from_background_
        , "protect_content"                        A..= protect_content_
        , "allow_paid_broadcast"                   A..= allow_paid_broadcast_
        , "update_order_of_installed_sticker_sets" A..= update_order_of_installed_sticker_sets_
        , "scheduling_state"                       A..= scheduling_state_
        , "effect_id"                              A..= fmap I.writeInt64  effect_id_
        , "sending_id"                             A..= sending_id_
        , "only_preview"                           A..= only_preview_
        ]

defaultMessageSendOptions :: MessageSendOptions
defaultMessageSendOptions =
  MessageSendOptions
    { disable_notification                   = Nothing
    , from_background                        = Nothing
    , protect_content                        = Nothing
    , allow_paid_broadcast                   = Nothing
    , update_order_of_installed_sticker_sets = Nothing
    , scheduling_state                       = Nothing
    , effect_id                              = Nothing
    , sending_id                             = Nothing
    , only_preview                           = Nothing
    }

