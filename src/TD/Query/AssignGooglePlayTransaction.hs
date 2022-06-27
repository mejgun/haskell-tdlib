{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AssignGooglePlayTransaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs server about a Telegram Premium purchase through Google Play. For official applications only @purchase_token Google Play purchase token
data AssignGooglePlayTransaction = AssignGooglePlayTransaction
  { -- |
    purchase_token :: Maybe String
  }
  deriving (Eq)

instance Show AssignGooglePlayTransaction where
  show
    AssignGooglePlayTransaction
      { purchase_token = purchase_token_
      } =
      "AssignGooglePlayTransaction"
        ++ U.cc
          [ U.p "purchase_token" purchase_token_
          ]

instance T.ToJSON AssignGooglePlayTransaction where
  toJSON
    AssignGooglePlayTransaction
      { purchase_token = purchase_token_
      } =
      A.object
        [ "@type" A..= T.String "assignGooglePlayTransaction",
          "purchase_token" A..= purchase_token_
        ]
