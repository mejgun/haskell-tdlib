module TD.Query.CreateInvoiceLink
  (CreateInvoiceLink(..)
  , defaultCreateInvoiceLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Creates a link for the given invoice; for bots only. Returns 'TD.Data.HttpUrl.HttpUrl'
data CreateInvoiceLink
  = CreateInvoiceLink
    { business_connection_id :: Maybe T.Text                                  -- ^ Unique identifier of business connection on behalf of which to send the request
    , invoice                :: Maybe InputMessageContent.InputMessageContent -- ^ Information about the invoice of the type inputMessageInvoice
    }
  deriving (Eq, Show)

instance I.ShortShow CreateInvoiceLink where
  shortShow
    CreateInvoiceLink
      { business_connection_id = business_connection_id_
      , invoice                = invoice_
      }
        = "CreateInvoiceLink"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "invoice"                `I.p` invoice_
          ]

instance AT.ToJSON CreateInvoiceLink where
  toJSON
    CreateInvoiceLink
      { business_connection_id = business_connection_id_
      , invoice                = invoice_
      }
        = A.object
          [ "@type"                  A..= AT.String "createInvoiceLink"
          , "business_connection_id" A..= business_connection_id_
          , "invoice"                A..= invoice_
          ]

defaultCreateInvoiceLink :: CreateInvoiceLink
defaultCreateInvoiceLink =
  CreateInvoiceLink
    { business_connection_id = Nothing
    , invoice                = Nothing
    }

