module TD.Query.ApplyPremiumGiftCode
  (ApplyPremiumGiftCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Applies a Telegram Premium gift code. Returns 'TD.Data.Ok.Ok'
data ApplyPremiumGiftCode
  = ApplyPremiumGiftCode
    { code :: Maybe T.Text -- ^ The code to apply
    }
  deriving (Eq, Show)

instance I.ShortShow ApplyPremiumGiftCode where
  shortShow
    ApplyPremiumGiftCode
      { code = code_
      }
        = "ApplyPremiumGiftCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON ApplyPremiumGiftCode where
  toJSON
    ApplyPremiumGiftCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "applyPremiumGiftCode"
          , "code"  A..= code_
          ]

