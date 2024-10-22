module TD.Data.MessageCopyOptions
  ( MessageCopyOptions(..)    
  , defaultMessageCopyOptions 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data MessageCopyOptions
  = MessageCopyOptions -- ^ Options to be used when a message content is copied without reference to the original sender. Service messages, messages with messageInvoice, messagePaidMedia, messageGiveaway, or messageGiveawayWinners content can't be copied
    { send_copy                    :: Maybe Bool                        -- ^ True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local. Use messageProperties.can_be_saved and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable
    , replace_caption              :: Maybe Bool                        -- ^ True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
    , new_caption                  :: Maybe FormattedText.FormattedText -- ^ New message caption; pass null to copy message without caption. Ignored if replace_caption is false
    , new_show_caption_above_media :: Maybe Bool                        -- ^ True, if new caption must be shown above the media; otherwise, new caption must be shown below the media; not supported in secret chats. Ignored if replace_caption is false
    }
  deriving (Eq, Show)

instance I.ShortShow MessageCopyOptions where
  shortShow MessageCopyOptions
    { send_copy                    = send_copy_
    , replace_caption              = replace_caption_
    , new_caption                  = new_caption_
    , new_show_caption_above_media = new_show_caption_above_media_
    }
      = "MessageCopyOptions"
        ++ I.cc
        [ "send_copy"                    `I.p` send_copy_
        , "replace_caption"              `I.p` replace_caption_
        , "new_caption"                  `I.p` new_caption_
        , "new_show_caption_above_media" `I.p` new_show_caption_above_media_
        ]

instance AT.FromJSON MessageCopyOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageCopyOptions" -> parseMessageCopyOptions v
      _                    -> mempty
    
    where
      parseMessageCopyOptions :: A.Value -> AT.Parser MessageCopyOptions
      parseMessageCopyOptions = A.withObject "MessageCopyOptions" $ \o -> do
        send_copy_                    <- o A..:?  "send_copy"
        replace_caption_              <- o A..:?  "replace_caption"
        new_caption_                  <- o A..:?  "new_caption"
        new_show_caption_above_media_ <- o A..:?  "new_show_caption_above_media"
        pure $ MessageCopyOptions
          { send_copy                    = send_copy_
          , replace_caption              = replace_caption_
          , new_caption                  = new_caption_
          , new_show_caption_above_media = new_show_caption_above_media_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageCopyOptions where
  toJSON MessageCopyOptions
    { send_copy                    = send_copy_
    , replace_caption              = replace_caption_
    , new_caption                  = new_caption_
    , new_show_caption_above_media = new_show_caption_above_media_
    }
      = A.object
        [ "@type"                        A..= AT.String "messageCopyOptions"
        , "send_copy"                    A..= send_copy_
        , "replace_caption"              A..= replace_caption_
        , "new_caption"                  A..= new_caption_
        , "new_show_caption_above_media" A..= new_show_caption_above_media_
        ]

defaultMessageCopyOptions :: MessageCopyOptions
defaultMessageCopyOptions =
  MessageCopyOptions
    { send_copy                    = Nothing
    , replace_caption              = Nothing
    , new_caption                  = Nothing
    , new_show_caption_above_media = Nothing
    }

