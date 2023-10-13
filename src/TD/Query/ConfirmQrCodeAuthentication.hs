module TD.Query.ConfirmQrCodeAuthentication(ConfirmQrCodeAuthentication(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ConfirmQrCodeAuthentication -- ^ Confirms QR code authentication on another device. Returns created session on success
  = ConfirmQrCodeAuthentication
    { link :: Maybe T.Text -- ^ A link from a QR code. The link must be scanned by the in-app camera
    }
  deriving (Eq)

instance Show ConfirmQrCodeAuthentication where
  show
    ConfirmQrCodeAuthentication
      { link = link_
      }
        = "ConfirmQrCodeAuthentication"
          ++ I.cc
          [ "link" `I.p` link_
          ]

instance AT.ToJSON ConfirmQrCodeAuthentication where
  toJSON
    ConfirmQrCodeAuthentication
      { link = link_
      }
        = A.object
          [ "@type" A..= AT.String "confirmQrCodeAuthentication"
          , "link"  A..= link_
          ]
