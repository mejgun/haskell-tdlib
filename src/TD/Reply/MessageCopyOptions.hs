{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.MessageCopyOptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FormattedText as FormattedText
import qualified Utils as U

data MessageCopyOptions = -- | Options to be used when a message content is copied without reference to the original sender. Service messages and messageInvoice can't be copied
  MessageCopyOptions
  { -- | New message caption; pass null to copy message without caption. Ignored if replace_caption is false
    new_caption :: Maybe FormattedText.FormattedText,
    -- | True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
    replace_caption :: Maybe Bool,
    -- | True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local
    send_copy :: Maybe Bool
  }
  deriving (Eq)

instance Show MessageCopyOptions where
  show
    MessageCopyOptions
      { new_caption = new_caption,
        replace_caption = replace_caption,
        send_copy = send_copy
      } =
      "MessageCopyOptions"
        ++ U.cc
          [ U.p "new_caption" new_caption,
            U.p "replace_caption" replace_caption,
            U.p "send_copy" send_copy
          ]

instance T.FromJSON MessageCopyOptions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageCopyOptions" -> parseMessageCopyOptions v
      _ -> fail ""
    where
      parseMessageCopyOptions :: A.Value -> T.Parser MessageCopyOptions
      parseMessageCopyOptions = A.withObject "MessageCopyOptions" $ \o -> do
        new_caption_ <- o A..:? "new_caption"
        replace_caption_ <- o A..:? "replace_caption"
        send_copy_ <- o A..:? "send_copy"
        return $ MessageCopyOptions {new_caption = new_caption_, replace_caption = replace_caption_, send_copy = send_copy_}
  parseJSON _ = fail ""

instance T.ToJSON MessageCopyOptions where
  toJSON
    MessageCopyOptions
      { new_caption = new_caption,
        replace_caption = replace_caption,
        send_copy = send_copy
      } =
      A.object
        [ "@type" A..= T.String "messageCopyOptions",
          "new_caption" A..= new_caption,
          "replace_caption" A..= replace_caption,
          "send_copy" A..= send_copy
        ]
