module TD.Data.InputInvoice
  (InputInvoice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes an invoice to process
data InputInvoice
  = InputInvoiceMessage -- ^ An invoice from a message of the type messageInvoice
    { chat_id    :: Maybe Int -- ^ Chat identifier of the message
    , message_id :: Maybe Int -- ^ Message identifier
    }
  | InputInvoiceName -- ^ An invoice from a link of the type internalLinkTypeInvoice
    { name :: Maybe T.Text -- ^ Name of the invoice
    }
  deriving (Eq)

instance Show InputInvoice where
  show InputInvoiceMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "InputInvoiceMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  show InputInvoiceName
    { name = name_
    }
      = "InputInvoiceName"
        ++ I.cc
        [ "name" `I.p` name_
        ]

instance AT.FromJSON InputInvoice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputInvoiceMessage" -> parseInputInvoiceMessage v
      "inputInvoiceName"    -> parseInputInvoiceName v
      _                     -> mempty
    
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

