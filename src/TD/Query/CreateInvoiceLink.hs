{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateInvoiceLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified Utils as U

-- |
-- Creates a link for the given invoice; for bots only @invoice Information about the invoice of the type inputMessageInvoice
data CreateInvoiceLink = CreateInvoiceLink
  { -- |
    invoice :: Maybe InputMessageContent.InputMessageContent
  }
  deriving (Eq)

instance Show CreateInvoiceLink where
  show
    CreateInvoiceLink
      { invoice = invoice_
      } =
      "CreateInvoiceLink"
        ++ U.cc
          [ U.p "invoice" invoice_
          ]

instance T.ToJSON CreateInvoiceLink where
  toJSON
    CreateInvoiceLink
      { invoice = invoice_
      } =
      A.object
        [ "@type" A..= T.String "createInvoiceLink",
          "invoice" A..= invoice_
        ]
