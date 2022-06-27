{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputInvoice as InputInvoice
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Returns an invoice payment form. This method must be called when the user presses inlineKeyboardButtonBuy
data GetPaymentForm = GetPaymentForm
  { -- | Preferred payment form theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | The invoice
    input_invoice :: Maybe InputInvoice.InputInvoice
  }
  deriving (Eq)

instance Show GetPaymentForm where
  show
    GetPaymentForm
      { theme = theme_,
        input_invoice = input_invoice_
      } =
      "GetPaymentForm"
        ++ U.cc
          [ U.p "theme" theme_,
            U.p "input_invoice" input_invoice_
          ]

instance T.ToJSON GetPaymentForm where
  toJSON
    GetPaymentForm
      { theme = theme_,
        input_invoice = input_invoice_
      } =
      A.object
        [ "@type" A..= T.String "getPaymentForm",
          "theme" A..= theme_,
          "input_invoice" A..= input_invoice_
        ]
