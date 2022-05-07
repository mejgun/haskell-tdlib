{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Address where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Address = -- | Describes an address @country_code A two-letter ISO 3166-1 alpha-2 country code @state State, if applicable @city City @street_line1 First line of the address @street_line2 Second line of the address @postal_code Address postal code
  Address
  { -- |
    postal_code :: Maybe String,
    -- |
    street_line2 :: Maybe String,
    -- |
    street_line1 :: Maybe String,
    -- |
    city :: Maybe String,
    -- |
    state :: Maybe String,
    -- |
    country_code :: Maybe String
  }
  deriving (Eq)

instance Show Address where
  show
    Address
      { postal_code = postal_code,
        street_line2 = street_line2,
        street_line1 = street_line1,
        city = city,
        state = state,
        country_code = country_code
      } =
      "Address"
        ++ U.cc
          [ U.p "postal_code" postal_code,
            U.p "street_line2" street_line2,
            U.p "street_line1" street_line1,
            U.p "city" city,
            U.p "state" state,
            U.p "country_code" country_code
          ]

instance T.FromJSON Address where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "address" -> parseAddress v
      _ -> fail ""
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
  parseJSON _ = fail ""

instance T.ToJSON Address where
  toJSON
    Address
      { postal_code = postal_code,
        street_line2 = street_line2,
        street_line1 = street_line1,
        city = city,
        state = state,
        country_code = country_code
      } =
      A.object
        [ "@type" A..= T.String "address",
          "postal_code" A..= postal_code,
          "street_line2" A..= street_line2,
          "street_line1" A..= street_line1,
          "city" A..= city,
          "state" A..= state,
          "country_code" A..= country_code
        ]
