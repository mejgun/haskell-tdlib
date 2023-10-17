module TD.Query.CreateInvoiceLink
  (CreateInvoiceLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Creates a link for the given invoice; for bots only
data CreateInvoiceLink
  = CreateInvoiceLink
    { invoice :: Maybe InputMessageContent.InputMessageContent -- ^ Information about the invoice of the type inputMessageInvoice
    }
  deriving (Eq, Show)

instance I.ShortShow CreateInvoiceLink where
  shortShow
    CreateInvoiceLink
      { invoice = invoice_
      }
        = "CreateInvoiceLink"
          ++ I.cc
          [ "invoice" `I.p` invoice_
          ]

instance AT.ToJSON CreateInvoiceLink where
  toJSON
    CreateInvoiceLink
      { invoice = invoice_
      }
        = A.object
          [ "@type"   A..= AT.String "createInvoiceLink"
          , "invoice" A..= invoice_
          ]

