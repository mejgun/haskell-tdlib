module TD.Data.Address
  ( Address(..)    
  , defaultAddress 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Address
  = Address -- ^ Describes an address
    { country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code
    , state        :: Maybe T.Text -- ^ State, if applicable
    , city         :: Maybe T.Text -- ^ City
    , street_line1 :: Maybe T.Text -- ^ First line of the address
    , street_line2 :: Maybe T.Text -- ^ Second line of the address
    , postal_code  :: Maybe T.Text -- ^ Address postal code
    }
  deriving (Eq, Show)

instance I.ShortShow Address where
  shortShow Address
    { country_code = country_code_
    , state        = state_
    , city         = city_
    , street_line1 = street_line1_
    , street_line2 = street_line2_
    , postal_code  = postal_code_
    }
      = "Address"
        ++ I.cc
        [ "country_code" `I.p` country_code_
        , "state"        `I.p` state_
        , "city"         `I.p` city_
        , "street_line1" `I.p` street_line1_
        , "street_line2" `I.p` street_line2_
        , "postal_code"  `I.p` postal_code_
        ]

instance AT.FromJSON Address where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "address" -> parseAddress v
      _         -> mempty
    
    where
      parseAddress :: A.Value -> AT.Parser Address
      parseAddress = A.withObject "Address" $ \o -> do
        country_code_ <- o A..:?  "country_code"
        state_        <- o A..:?  "state"
        city_         <- o A..:?  "city"
        street_line1_ <- o A..:?  "street_line1"
        street_line2_ <- o A..:?  "street_line2"
        postal_code_  <- o A..:?  "postal_code"
        pure $ Address
          { country_code = country_code_
          , state        = state_
          , city         = city_
          , street_line1 = street_line1_
          , street_line2 = street_line2_
          , postal_code  = postal_code_
          }
  parseJSON _ = mempty

instance AT.ToJSON Address where
  toJSON Address
    { country_code = country_code_
    , state        = state_
    , city         = city_
    , street_line1 = street_line1_
    , street_line2 = street_line2_
    , postal_code  = postal_code_
    }
      = A.object
        [ "@type"        A..= AT.String "address"
        , "country_code" A..= country_code_
        , "state"        A..= state_
        , "city"         A..= city_
        , "street_line1" A..= street_line1_
        , "street_line2" A..= street_line2_
        , "postal_code"  A..= postal_code_
        ]

defaultAddress :: Address
defaultAddress =
  Address
    { country_code = Nothing
    , state        = Nothing
    , city         = Nothing
    , street_line1 = Nothing
    , street_line2 = Nothing
    , postal_code  = Nothing
    }

