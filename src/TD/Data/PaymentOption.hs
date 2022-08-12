{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PaymentOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data PaymentOption = -- | Describes an additional payment option @title Title for the payment option @url Payment form URL to be opened in a web view
  PaymentOption
  { -- |
    url :: Maybe String,
    -- |
    title :: Maybe String
  }
  deriving (Eq)

instance Show PaymentOption where
  show
    PaymentOption
      { url = url_,
        title = title_
      } =
      "PaymentOption"
        ++ U.cc
          [ U.p "url" url_,
            U.p "title" title_
          ]

instance T.FromJSON PaymentOption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentOption" -> parsePaymentOption v
      _ -> mempty
    where
      parsePaymentOption :: A.Value -> T.Parser PaymentOption
      parsePaymentOption = A.withObject "PaymentOption" $ \o -> do
        url_ <- o A..:? "url"
        title_ <- o A..:? "title"
        return $ PaymentOption {url = url_, title = title_}
  parseJSON _ = mempty

instance T.ToJSON PaymentOption where
  toJSON
    PaymentOption
      { url = url_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "paymentOption",
          "url" A..= url_,
          "title" A..= title_
        ]
