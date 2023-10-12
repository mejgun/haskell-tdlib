module TD.Query.AssignGooglePlayTransaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose

data AssignGooglePlayTransaction -- ^ Informs server about a purchase through Google Play. For official applications only
  = AssignGooglePlayTransaction
    { package_name     :: Maybe T.Text                                  -- ^ Application package name
    , store_product_id :: Maybe T.Text                                  -- ^ Identifier of the purchased store product
    , purchase_token   :: Maybe T.Text                                  -- ^ Google Play purchase token
    , purpose          :: Maybe StorePaymentPurpose.StorePaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq)

instance Show AssignGooglePlayTransaction where
  show
    AssignGooglePlayTransaction
      { package_name     = package_name_
      , store_product_id = store_product_id_
      , purchase_token   = purchase_token_
      , purpose          = purpose_
      }
        = "AssignGooglePlayTransaction"
          ++ I.cc
          [ "package_name"     `I.p` package_name_
          , "store_product_id" `I.p` store_product_id_
          , "purchase_token"   `I.p` purchase_token_
          , "purpose"          `I.p` purpose_
          ]

instance AT.ToJSON AssignGooglePlayTransaction where
  toJSON
    AssignGooglePlayTransaction
      { package_name     = package_name_
      , store_product_id = store_product_id_
      , purchase_token   = purchase_token_
      , purpose          = purpose_
      }
        = A.object
          [ "@type"            A..= AT.String "assignGooglePlayTransaction"
          , "package_name"     A..= package_name_
          , "store_product_id" A..= store_product_id_
          , "purchase_token"   A..= purchase_token_
          , "purpose"          A..= purpose_
          ]
