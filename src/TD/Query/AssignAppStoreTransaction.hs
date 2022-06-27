{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AssignAppStoreTransaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs server about a Telegram Premium purchase through App Store. For official applications only @receipt App Store receipt @is_restore True, if this is restore of Premium purchase
data AssignAppStoreTransaction = AssignAppStoreTransaction
  { -- |
    is_restore :: Maybe Bool,
    -- |
    receipt :: Maybe String
  }
  deriving (Eq)

instance Show AssignAppStoreTransaction where
  show
    AssignAppStoreTransaction
      { is_restore = is_restore_,
        receipt = receipt_
      } =
      "AssignAppStoreTransaction"
        ++ U.cc
          [ U.p "is_restore" is_restore_,
            U.p "receipt" receipt_
          ]

instance T.ToJSON AssignAppStoreTransaction where
  toJSON
    AssignAppStoreTransaction
      { is_restore = is_restore_,
        receipt = receipt_
      } =
      A.object
        [ "@type" A..= T.String "assignAppStoreTransaction",
          "is_restore" A..= is_restore_,
          "receipt" A..= receipt_
        ]
