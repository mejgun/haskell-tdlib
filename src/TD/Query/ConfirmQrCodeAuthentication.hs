{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ConfirmQrCodeAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Confirms QR code authentication on another device. Returns created session on success @link A link from a QR code. The link must be scanned by the in-app camera
data ConfirmQrCodeAuthentication = ConfirmQrCodeAuthentication
  { -- |
    link :: Maybe String
  }
  deriving (Eq)

instance Show ConfirmQrCodeAuthentication where
  show
    ConfirmQrCodeAuthentication
      { link = link
      } =
      "ConfirmQrCodeAuthentication"
        ++ U.cc
          [ U.p "link" link
          ]

instance T.ToJSON ConfirmQrCodeAuthentication where
  toJSON
    ConfirmQrCodeAuthentication
      { link = link
      } =
      A.object
        [ "@type" A..= T.String "confirmQrCodeAuthentication",
          "link" A..= link
        ]
