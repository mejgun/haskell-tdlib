{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBankCardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a bank card @bank_card_number The bank card number
data GetBankCardInfo = GetBankCardInfo
  { -- |
    bank_card_number :: Maybe String
  }
  deriving (Eq)

instance Show GetBankCardInfo where
  show
    GetBankCardInfo
      { bank_card_number = bank_card_number_
      } =
      "GetBankCardInfo"
        ++ U.cc
          [ U.p "bank_card_number" bank_card_number_
          ]

instance T.ToJSON GetBankCardInfo where
  toJSON
    GetBankCardInfo
      { bank_card_number = bank_card_number_
      } =
      A.object
        [ "@type" A..= T.String "getBankCardInfo",
          "bank_card_number" A..= bank_card_number_
        ]
