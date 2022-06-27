{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputInvoice where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describe an invoice to process
data InputInvoice
  = -- | An invoice from a message of the type messageInvoice @chat_id Chat identifier of the message @message_id Message identifier
    InputInvoiceMessage
      { -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | An invoice from a link of the type internalLinkTypeInvoice @name Name of the invoice
    InputInvoiceName
      { -- |
        name :: Maybe String
      }
  deriving (Eq)

instance Show InputInvoice where
  show
    InputInvoiceMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "InputInvoiceMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    InputInvoiceName
      { name = name_
      } =
      "InputInvoiceName"
        ++ U.cc
          [ U.p "name" name_
          ]

instance T.FromJSON InputInvoice where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputInvoiceMessage" -> parseInputInvoiceMessage v
      "inputInvoiceName" -> parseInputInvoiceName v
      _ -> mempty
    where
      parseInputInvoiceMessage :: A.Value -> T.Parser InputInvoice
      parseInputInvoiceMessage = A.withObject "InputInvoiceMessage" $ \o -> do
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ InputInvoiceMessage {message_id = message_id_, chat_id = chat_id_}

      parseInputInvoiceName :: A.Value -> T.Parser InputInvoice
      parseInputInvoiceName = A.withObject "InputInvoiceName" $ \o -> do
        name_ <- o A..:? "name"
        return $ InputInvoiceName {name = name_}
  parseJSON _ = mempty

instance T.ToJSON InputInvoice where
  toJSON
    InputInvoiceMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "inputInvoiceMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    InputInvoiceName
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "inputInvoiceName",
          "name" A..= name_
        ]
