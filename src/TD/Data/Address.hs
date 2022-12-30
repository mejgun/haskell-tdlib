{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Address where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Address = -- | Describes an address
  Address
  { -- | Address postal code
    postal_code :: Maybe String,
    -- | Second line of the address
    street_line2 :: Maybe String,
    -- | First line of the address
    street_line1 :: Maybe String,
    -- | City
    city :: Maybe String,
    -- | State, if applicable
    state :: Maybe String,
    -- | A two-letter ISO 3166-1 alpha-2 country code
    country_code :: Maybe String
  }
  deriving (Eq)

instance Show Address where
  show
    Address
      { postal_code = postal_code_,
        street_line2 = street_line2_,
        street_line1 = street_line1_,
        city = city_,
        state = state_,
        country_code = country_code_
      } =
      "Address"
        ++ U.cc
          [ U.p "postal_code" postal_code_,
            U.p "street_line2" street_line2_,
            U.p "street_line1" street_line1_,
            U.p "city" city_,
            U.p "state" state_,
            U.p "country_code" country_code_
          ]

instance T.FromJSON Address where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "address" -> parseAddress v
      _ -> mempty
    where
      parseAddress :: A.Value -> T.Parser Address
      parseAddress = A.withObject "Address" $ \o -> do
        postal_code_ <- o A..:? "postal_code"
        street_line2_ <- o A..:? "street_line2"
        street_line1_ <- o A..:? "street_line1"
        city_ <- o A..:? "city"
        state_ <- o A..:? "state"
        country_code_ <- o A..:? "country_code"
        return $ Address {postal_code = postal_code_, street_line2 = street_line2_, street_line1 = street_line1_, city = city_, state = state_, country_code = country_code_}
  parseJSON _ = mempty

instance T.ToJSON Address where
  toJSON
    Address
      { postal_code = postal_code_,
        street_line2 = street_line2_,
        street_line1 = street_line1_,
        city = city_,
        state = state_,
        country_code = country_code_
      } =
      A.object
        [ "@type" A..= T.String "address",
          "postal_code" A..= postal_code_,
          "street_line2" A..= street_line2_,
          "street_line1" A..= street_line1_,
          "city" A..= city_,
          "state" A..= state_,
          "country_code" A..= country_code_
        ]
