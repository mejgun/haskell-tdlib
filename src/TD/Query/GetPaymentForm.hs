module TD.Query.GetPaymentForm
  (GetPaymentForm(..)
  , defaultGetPaymentForm
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputInvoice as InputInvoice
import qualified TD.Data.ThemeParameters as ThemeParameters

-- | Returns an invoice payment form. This method must be called when the user presses inline button of the type inlineKeyboardButtonTypeBuy, or wants to buy access to media in a messagePaidMedia message. Returns 'TD.Data.PaymentForm.PaymentForm'
data GetPaymentForm
  = GetPaymentForm
    { input_invoice :: Maybe InputInvoice.InputInvoice       -- ^ The invoice
    , theme         :: Maybe ThemeParameters.ThemeParameters -- ^ Preferred payment form theme; pass null to use the default theme
    }
  deriving (Eq, Show)

instance I.ShortShow GetPaymentForm where
  shortShow
    GetPaymentForm
      { input_invoice = input_invoice_
      , theme         = theme_
      }
        = "GetPaymentForm"
          ++ I.cc
          [ "input_invoice" `I.p` input_invoice_
          , "theme"         `I.p` theme_
          ]

instance AT.ToJSON GetPaymentForm where
  toJSON
    GetPaymentForm
      { input_invoice = input_invoice_
      , theme         = theme_
      }
        = A.object
          [ "@type"         A..= AT.String "getPaymentForm"
          , "input_invoice" A..= input_invoice_
          , "theme"         A..= theme_
          ]

defaultGetPaymentForm :: GetPaymentForm
defaultGetPaymentForm =
  GetPaymentForm
    { input_invoice = Nothing
    , theme         = Nothing
    }

