module TD.Query.ValidateOrderInfo
  (ValidateOrderInfo(..)
  , defaultValidateOrderInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputInvoice as InputInvoice
import qualified TD.Data.OrderInfo as OrderInfo

-- | Validates the order information provided by a user and returns the available shipping options for a flexible invoice. Returns 'TD.Data.ValidatedOrderInfo.ValidatedOrderInfo'
data ValidateOrderInfo
  = ValidateOrderInfo
    { input_invoice :: Maybe InputInvoice.InputInvoice -- ^ The invoice
    , order_info    :: Maybe OrderInfo.OrderInfo       -- ^ The order information, provided by the user; pass null if empty
    , allow_save    :: Maybe Bool                      -- ^ Pass true to save the order information
    }
  deriving (Eq, Show)

instance I.ShortShow ValidateOrderInfo where
  shortShow
    ValidateOrderInfo
      { input_invoice = input_invoice_
      , order_info    = order_info_
      , allow_save    = allow_save_
      }
        = "ValidateOrderInfo"
          ++ I.cc
          [ "input_invoice" `I.p` input_invoice_
          , "order_info"    `I.p` order_info_
          , "allow_save"    `I.p` allow_save_
          ]

instance AT.ToJSON ValidateOrderInfo where
  toJSON
    ValidateOrderInfo
      { input_invoice = input_invoice_
      , order_info    = order_info_
      , allow_save    = allow_save_
      }
        = A.object
          [ "@type"         A..= AT.String "validateOrderInfo"
          , "input_invoice" A..= input_invoice_
          , "order_info"    A..= order_info_
          , "allow_save"    A..= allow_save_
          ]

defaultValidateOrderInfo :: ValidateOrderInfo
defaultValidateOrderInfo =
  ValidateOrderInfo
    { input_invoice = Nothing
    , order_info    = Nothing
    , allow_save    = Nothing
    }

