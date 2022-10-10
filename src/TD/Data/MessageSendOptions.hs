{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSendOptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState
import qualified Utils as U

-- |
data MessageSendOptions = -- | Options to be used when a message is sent
  MessageSendOptions
  { -- | Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
    scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState,
    -- | Pass true if the user explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
    update_order_of_installed_sticker_sets :: Maybe Bool,
    -- | Pass true if the content of the message must be protected from forwarding and saving; for bots only
    protect_content :: Maybe Bool,
    -- | Pass true if the message is sent from the background
    from_background :: Maybe Bool,
    -- | Pass true to disable notification for the message
    disable_notification :: Maybe Bool
  }
  deriving (Eq)

instance Show MessageSendOptions where
  show
    MessageSendOptions
      { scheduling_state = scheduling_state_,
        update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_,
        protect_content = protect_content_,
        from_background = from_background_,
        disable_notification = disable_notification_
      } =
      "MessageSendOptions"
        ++ U.cc
          [ U.p "scheduling_state" scheduling_state_,
            U.p "update_order_of_installed_sticker_sets" update_order_of_installed_sticker_sets_,
            U.p "protect_content" protect_content_,
            U.p "from_background" from_background_,
            U.p "disable_notification" disable_notification_
          ]

instance T.FromJSON MessageSendOptions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSendOptions" -> parseMessageSendOptions v
      _ -> mempty
    where
      parseMessageSendOptions :: A.Value -> T.Parser MessageSendOptions
      parseMessageSendOptions = A.withObject "MessageSendOptions" $ \o -> do
        scheduling_state_ <- o A..:? "scheduling_state"
        update_order_of_installed_sticker_sets_ <- o A..:? "update_order_of_installed_sticker_sets"
        protect_content_ <- o A..:? "protect_content"
        from_background_ <- o A..:? "from_background"
        disable_notification_ <- o A..:? "disable_notification"
        return $ MessageSendOptions {scheduling_state = scheduling_state_, update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_, protect_content = protect_content_, from_background = from_background_, disable_notification = disable_notification_}
  parseJSON _ = mempty

instance T.ToJSON MessageSendOptions where
  toJSON
    MessageSendOptions
      { scheduling_state = scheduling_state_,
        update_order_of_installed_sticker_sets = update_order_of_installed_sticker_sets_,
        protect_content = protect_content_,
        from_background = from_background_,
        disable_notification = disable_notification_
      } =
      A.object
        [ "@type" A..= T.String "messageSendOptions",
          "scheduling_state" A..= scheduling_state_,
          "update_order_of_installed_sticker_sets" A..= update_order_of_installed_sticker_sets_,
          "protect_content" A..= protect_content_,
          "from_background" A..= from_background_,
          "disable_notification" A..= disable_notification_
        ]
