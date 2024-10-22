module TD.Data.InputInvoice
  (InputInvoice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TelegramPaymentPurpose as TelegramPaymentPurpose

-- | Describes an invoice to process
data InputInvoice
  = InputInvoiceMessage -- ^ An invoice from a message of the type messageInvoice or paid media purchase from messagePaidMedia
    { chat_id    :: Maybe Int -- ^ Chat identifier of the message
    , message_id :: Maybe Int -- ^ Message identifier. Use messageProperties.can_be_paid to check whether the message can be used in the method
    }
  | InputInvoiceName -- ^ An invoice from a link of the type internalLinkTypeInvoice
    { name :: Maybe T.Text -- ^ Name of the invoice
    }
  | InputInvoiceTelegram -- ^ An invoice for a payment toward Telegram; must not be used in the in-store apps
    { purpose :: Maybe TelegramPaymentPurpose.TelegramPaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq, Show)

instance I.ShortShow InputInvoice where
  shortShow InputInvoiceMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "InputInvoiceMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  shortShow InputInvoiceName
    { name = name_
    }
      = "InputInvoiceName"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow InputInvoiceTelegram
    { purpose = purpose_
    }
      = "InputInvoiceTelegram"
        ++ I.cc
        [ "purpose" `I.p` purpose_
        ]

instance AT.FromJSON InputInvoice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputInvoiceMessage"  -> parseInputInvoiceMessage v
      "inputInvoiceName"     -> parseInputInvoiceName v
      "inputInvoiceTelegram" -> parseInputInvoiceTelegram v
      _                      -> mempty
    
    where
      parseInputInvoiceMessage :: A.Value -> AT.Parser InputInvoice
      parseInputInvoiceMessage = A.withObject "InputInvoiceMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ InputInvoiceMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseInputInvoiceName :: A.Value -> AT.Parser InputInvoice
      parseInputInvoiceName = A.withObject "InputInvoiceName" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ InputInvoiceName
          { name = name_
          }
      parseInputInvoiceTelegram :: A.Value -> AT.Parser InputInvoice
      parseInputInvoiceTelegram = A.withObject "InputInvoiceTelegram" $ \o -> do
        purpose_ <- o A..:?  "purpose"
        pure $ InputInvoiceTelegram
          { purpose = purpose_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputInvoice where
  toJSON InputInvoiceMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "inputInvoiceMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON InputInvoiceName
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "inputInvoiceName"
        , "name"  A..= name_
        ]
  toJSON InputInvoiceTelegram
    { purpose = purpose_
    }
      = A.object
        [ "@type"   A..= AT.String "inputInvoiceTelegram"
        , "purpose" A..= purpose_
        ]

