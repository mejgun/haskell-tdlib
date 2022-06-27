{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumLimit where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PremiumLimitType as PremiumLimitType
import qualified Utils as U

-- |
data PremiumLimit = -- | Contains information about a limit, increased for Premium users @type The type of the limit @default_value Default value of the limit @premium_value Value of the limit for Premium users
  PremiumLimit
  { -- |
    premium_value :: Maybe Int,
    -- |
    default_value :: Maybe Int,
    -- |
    _type :: Maybe PremiumLimitType.PremiumLimitType
  }
  deriving (Eq)

instance Show PremiumLimit where
  show
    PremiumLimit
      { premium_value = premium_value_,
        default_value = default_value_,
        _type = _type_
      } =
      "PremiumLimit"
        ++ U.cc
          [ U.p "premium_value" premium_value_,
            U.p "default_value" default_value_,
            U.p "_type" _type_
          ]

instance T.FromJSON PremiumLimit where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumLimit" -> parsePremiumLimit v
      _ -> mempty
    where
      parsePremiumLimit :: A.Value -> T.Parser PremiumLimit
      parsePremiumLimit = A.withObject "PremiumLimit" $ \o -> do
        premium_value_ <- o A..:? "premium_value"
        default_value_ <- o A..:? "default_value"
        _type_ <- o A..:? "type"
        return $ PremiumLimit {premium_value = premium_value_, default_value = default_value_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON PremiumLimit where
  toJSON
    PremiumLimit
      { premium_value = premium_value_,
        default_value = default_value_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "premiumLimit",
          "premium_value" A..= premium_value_,
          "default_value" A..= default_value_,
          "type" A..= _type_
        ]
