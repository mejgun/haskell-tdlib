{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PaymentResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data PaymentResult = -- | Contains the result of a payment request @success True, if the payment request was successful; otherwise, the verification_url will be non-empty @verification_url URL for additional payment credentials verification
  PaymentResult
  { -- |
    verification_url :: Maybe String,
    -- |
    success :: Maybe Bool
  }
  deriving (Eq)

instance Show PaymentResult where
  show
    PaymentResult
      { verification_url = verification_url_,
        success = success_
      } =
      "PaymentResult"
        ++ U.cc
          [ U.p "verification_url" verification_url_,
            U.p "success" success_
          ]

instance T.FromJSON PaymentResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentResult" -> parsePaymentResult v
      _ -> mempty
    where
      parsePaymentResult :: A.Value -> T.Parser PaymentResult
      parsePaymentResult = A.withObject "PaymentResult" $ \o -> do
        verification_url_ <- o A..:? "verification_url"
        success_ <- o A..:? "success"
        return $ PaymentResult {verification_url = verification_url_, success = success_}
  parseJSON _ = mempty

instance T.ToJSON PaymentResult where
  toJSON
    PaymentResult
      { verification_url = verification_url_,
        success = success_
      } =
      A.object
        [ "@type" A..= T.String "paymentResult",
          "verification_url" A..= verification_url_,
          "success" A..= success_
        ]
